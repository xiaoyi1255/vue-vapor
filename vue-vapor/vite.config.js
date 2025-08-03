/*
 * @Author: 静明 
 * @Date: 2025-07-28 23:15:18
 * @LastEditors: 静明
 * @LastEditTime: 2025-07-28 23:49:04
 * @FilePath: \vue-vapor\vite.config.js
 * @Description: 
 * 
 * Copyright (c) 2025 by ${git_name_email}, All Rights Reserved. 
 */
import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

// https://vite.dev/config/
export default defineConfig({
  sourcemap: false,
  plugins: [vue()],
})
