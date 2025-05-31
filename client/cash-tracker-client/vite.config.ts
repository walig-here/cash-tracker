import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vite.dev/config/
export default defineConfig({
  plugins: [
    react(),
  ],
  server: {
    https: {
      key: '/home/workspace/certs/server.key',
      cert: '/home/workspace/certs/server.crt',
    },
  },
})
