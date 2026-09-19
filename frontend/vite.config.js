import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import { cloudflare } from '@cloudflare/vite-plugin'
import path from 'node:path'
import fs from 'node:fs'
import { fileURLToPath } from 'node:url'

const __dirname = path.dirname(fileURLToPath(import.meta.url))
const wranglerHome = path.resolve(__dirname, '.wrangler-home')
if (!fs.existsSync(wranglerHome)) {
  fs.mkdirSync(wranglerHome, { recursive: true })
}
if (!process.env.WRANGLER_HOME) {
  process.env.WRANGLER_HOME = wranglerHome
}
if (!process.env.XDG_CONFIG_HOME) {
  process.env.XDG_CONFIG_HOME = wranglerHome
}

export default defineConfig({
  plugins: [
    react(),
    cloudflare(),
  ],
  build: {
    target: 'es2022',
  },
})
