export const prerender = false;

import fs from 'fs/promises';
import path from 'path';

export async function POST({ request }: { request: Request }) {
  try {
    const text = await request.text();
    console.log('API save-selection POST raw text length:', text ? text.length : 0);
    if (!text) {
      console.error('API save-selection POST: empty request body');
      return new Response(JSON.stringify({ ok: false, error: 'empty body' }), { status: 400, headers: { 'content-type': 'application/json' } });
    }
    let body;
    try {
      body = JSON.parse(text);
    } catch (parseErr) {
      console.error('API save-selection POST invalid JSON text:', text);
      return new Response(JSON.stringify({ ok: false, error: 'invalid json', text }), { status: 400, headers: { 'content-type': 'application/json' } });
    }

    console.log('API save-selection POST body:', body);
    const filePath = path.join(process.cwd(), 'public', 'selection.json');
    await fs.writeFile(filePath, JSON.stringify(body, null, 2), 'utf-8');
    return new Response(JSON.stringify({ ok: true }), { status: 200, headers: { 'content-type': 'application/json' } });
  } catch (err) {
    console.error('API save-selection POST error:', err);
    return new Response(JSON.stringify({ ok: false, error: 'server error' }), { status: 500, headers: { 'content-type': 'application/json' } });
  }
}

export async function GET() {
  try {
    const filePath = path.join(process.cwd(), 'public', 'selection.json');
    const data = await fs.readFile(filePath, 'utf-8');
    return new Response(data, { status: 200, headers: { 'content-type': 'application/json' } });
  } catch (err) {
    console.error('API save-selection GET error:', err);
    return new Response(JSON.stringify({ ok: false, error: 'Not found' }), { status: 404, headers: { 'content-type': 'application/json' } });
  }
}
