/*
 * @Author: taijingming 
 * @Date: 2025-08-03 15:13:43
 * @LastEditors: taijingming
 * @LastEditTime: 2025-08-03 18:29:22
 * @FilePath: \vue-vapor\vue-vapor\src\main.js
 * @Description: 
 * 
 * Copyright (c) 2025 by ${git_name_email}, All Rights Reserved. 
 */
import { createVaporApp } from 'vue'
import App from './App.vue'
const app = createVaporApp(App)
app.mount('#app')


// import { createApp, vaporInteropPlugin } from 'vue'
// import App from './App.vue'
// const app = createApp(App)
// app.use(vaporInteropPlugin)
// app.mount('#app')
