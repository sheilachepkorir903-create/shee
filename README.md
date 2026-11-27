# BSAMS Biometric Bridge

A web page **cannot talk to a USB fingerprint scanner directly**. BSAMS therefore uses a small
local program – the *bridge* – that runs on the attendance computer, talks to the scanner through
the **vendor's SDK**, and offers three simple HTTP endpoints on `127.0.0.1` only.

```
Browser (attendance station) --POST /capture-->  Bridge  --SDK-->  USB scanner
PHP (BridgeProvider)         --POST /match---->  Bridge  --SDK matcher
```

Because every scanner brand has a different SDK, only the bridge changes when the hardware
changes. The rest of BSAMS (PHP, database, pages) stays exactly the same.

## 1. The contract every bridge must implement

| Method & path | Request body (JSON) | Response (JSON) |
|---|---|---|
| `GET /status` | – | `{"ok":true,"device":"<model>","sdk":"<name version>"}` |
| `POST /capture` | `{}` | `{"ok":true,"template":"<base64>","quality":0-100,"format":"<ISO19794-2 or vendor>"}` or `{"ok":false,"message":"..."}` |
| `POST /match` | `{"probe":"<base64>","candidates":[{"id":12,"template":"<base64>"}]}` | `{"ok":true,"bestId":12 or null,"score":0-100}` |

Rules:
- Listen on **127.0.0.1** only (never 0.0.0.0) – templates must not leave the computer.
- `score` must be **normalised to 0–100** (convert the vendor's own score range).
- Never return or store the fingerprint **image**; return only the template.
- Send CORS headers allowing the BSAMS origin (e.g. `http://localhost`) so the browser may call `/capture`.
- Set *Settings → Fingerprint driver* to **Hardware bridge** and *Bridge URL* to `http://127.0.0.1:8765`.

## 2. Testing without hardware – the MOCK bridge

`mock_bridge.js` implements the same contract with **synthetic** templates. It lets you test the
complete hardware code path (BridgeProvider, scanner adapter, CORS, encryption, matching) before
a scanner is bought. Results are **not** real biometric results.

```bash
node bridge/mock_bridge.js
```

## 3. Building the real bridge for your scanner

1. Buy one USB optical scanner that has a **Windows SDK** (for example SecuGen Hamster series,
   HID DigitalPersona U.are.U series, ZKTeco SLK/ZK series or Futronic FS series). Install its
   driver and SDK, and run the vendor's demo program to confirm the scanner works.
2. Create the bridge in the language the SDK supports (usually C#/.NET or C++). A .NET console
   app with `HttpListener` on `http://127.0.0.1:8765/` is the simplest option.
3. Implement the three endpoints by calling the SDK functions that do these jobs
   (names differ per vendor – look them up in your SDK manual):
   - **open device** (once at start-up) → used by `/status`
   - **capture image + get image quality + create template** → `/capture`
     (prefer the ISO/IEC 19794-2 minutiae template format if the SDK offers it)
   - **match two templates → score**, loop over `candidates`, keep the highest → `/match`
4. Convert the vendor score to 0–100 and choose the BSAMS *Match threshold* using the vendor's
   recommended security level.
5. Test with the BSAMS test suite (`tests/run_tests.php --bridge`) and then with volunteers.

> Some vendors already ship a local web service (for example SecuGen documents a *WebAPI*
> service that returns templates as JSON on a local HTTPS port). In that case the bridge can be a
> thin adapter that forwards `/capture` and `/match` to the vendor service and reshapes the JSON
> into the contract above. Confirm the exact endpoints in the vendor's current documentation.

## 4. Re-enrolment

Templates are stored per driver (`simulated` / `hardware`). Templates from the simulator or from a
different scanner brand cannot be matched by a new SDK, so students must be re-enrolled after the
hardware is installed or changed.
