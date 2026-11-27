/**
 * BSAMS MOCK biometric bridge  —  FOR TESTING THE HARDWARE CODE PATH ONLY.
 * It implements exactly the same HTTP contract as the real bridge (see README.md) but produces
 * synthetic templates instead of reading a USB scanner. It is NOT real fingerprint recognition.
 *
 * Run:   node bridge/mock_bridge.js            (listens on http://127.0.0.1:8765)
 *
 *   GET  /status                              -> {ok, device, sdk}
 *   POST /capture   {"simulate":"<identity>"} -> {ok, template(base64), quality, format}
 *                   (a real bridge ignores the body and reads the finger on the scanner)
 *   POST /match     {probe, candidates:[{id, template}]} -> {ok, bestId, score}
 */
const http = require('http');
const crypto = require('crypto');

const PORT = Number(process.env.BRIDGE_PORT || 8765);
const DIM = 64;
let nextIdentity = null;

function baseVector(identity) {
  const v = [];
  for (let i = 0; v.length < DIM; i++) {
    const h = crypto.createHash('sha256').update(identity + '#' + i).digest();
    for (let j = 0; j < h.length && v.length < DIM; j += 2) v.push(h.readUInt16BE(j) / 32767.5 - 1);
  }
  return v;
}
function gauss() { let u = 0; while (!u) u = Math.random(); return Math.sqrt(-2 * Math.log(u)) * Math.cos(2 * Math.PI * Math.random()); }
function toTemplate(vec) {
  const buf = Buffer.alloc(8 + DIM * 4);
  buf.write('MOCKFP01', 0, 'ascii');                       // 8-byte header (a real SDK has its own format)
  vec.forEach((x, i) => buf.writeFloatLE(x, 8 + i * 4));
  return buf.toString('base64');
}
function fromTemplate(b64) {
  const buf = Buffer.from(b64, 'base64');
  if (buf.length !== 8 + DIM * 4 || buf.toString('ascii', 0, 8) !== 'MOCKFP01') throw new Error('bad template');
  return Array.from({ length: DIM }, (_, i) => buf.readFloatLE(8 + i * 4));
}
function similarity(a, b) {
  let d = 0, na = 0, nb = 0;
  for (let i = 0; i < DIM; i++) { d += a[i] * b[i]; na += a[i] ** 2; nb += b[i] ** 2; }
  return Math.max(0, d / (Math.sqrt(na) * Math.sqrt(nb))) * 100;
}

function send(res, code, obj) {
  res.writeHead(code, {
    'Content-Type': 'application/json',
    // Allow the BSAMS page served by Apache on localhost to call this local service
    'Access-Control-Allow-Origin': process.env.BSAMS_ORIGIN || 'http://localhost',
    'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
    'Access-Control-Allow-Headers': 'Content-Type',
    'Access-Control-Allow-Private-Network': 'true',
  });
  res.end(JSON.stringify(obj));
}

http.createServer((req, res) => {
  if (req.method === 'OPTIONS') return send(res, 204, {});
  let body = '';
  req.on('data', (c) => { body += c; if (body.length > 5e6) req.destroy(); });
  req.on('end', () => {
    let data = {};
    try { data = body ? JSON.parse(body) : {}; } catch { return send(res, 400, { ok: false, message: 'Invalid JSON' }); }
    if (req.method === 'GET' && req.url === '/status') {
      return send(res, 200, { ok: true, device: 'MOCK scanner (no hardware)', sdk: 'BSAMS mock bridge 1.0' });
    }
    if (req.method === 'POST' && req.url === '/mock/next') {
      // Testing helper: choose whose "finger" the next browser capture will return.
      nextIdentity = typeof data.identity === 'string' ? data.identity : null;
      return send(res, 200, { ok: true, next: nextIdentity });
    }
    if (req.method === 'POST' && req.url === '/capture') {
      const identity = typeof data.simulate === 'string' ? data.simulate
        : (nextIdentity || 'random:' + crypto.randomBytes(8).toString('hex'));
      const vec = baseVector(identity).map((x) => x + gauss() * 0.15);
      return send(res, 200, { ok: true, template: toTemplate(vec), quality: 60 + Math.floor(Math.random() * 35), format: 'MOCKFP01' });
    }
    if (req.method === 'POST' && req.url === '/match') {
      try {
        const probe = fromTemplate(data.probe);
        let best = { id: null, score: 0 };
        for (const c of data.candidates || []) {
          const s = similarity(probe, fromTemplate(c.template));
          if (s > best.score) best = { id: c.id, score: s };
        }
        return send(res, 200, { ok: true, bestId: best.id, score: Math.round(best.score * 100) / 100 });
      } catch (e) {
        return send(res, 422, { ok: false, message: e.message });
      }
    }
    send(res, 404, { ok: false, message: 'Not found' });
  });
}).listen(PORT, '127.0.0.1', () => console.log(`BSAMS MOCK bridge listening on http://127.0.0.1:${PORT} (testing only - no real fingerprints)`));
