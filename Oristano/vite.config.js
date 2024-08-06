import { fileURLToPath, URL } from 'node:url'

import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

// https://vitejs.dev/config/
export default defineConfig({
  server:{
    host: 'localhost',
    port:5173,
    proxy: {
      '/api/':{
        target: 'http://localhost:3000',
        secure: false,
        changeOrigin: false,
        rewrite: path => path.replace(/^\/api/, '')
      }
    } 
  },
  plugins: [
    vue(),
  ],
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url))
    }
  }
})
