<!--
 * @Author: taijingming 
 * @Date: 2025-08-03 15:13:43
 * @LastEditors: taijingming
 * @LastEditTime: 2025-08-03 16:35:17
 * @FilePath: \vue-vapor\vite-vue3\src\App.vue
 * @Description: 
 * 
 * Copyright (c) 2025 by ${git_name_email}, All Rights Reserved. 
-->
<template>
  <div id="app1">
    <header class="app-header">
      <img src="./assets/vue.svg" alt="Vue logo" class="logo">
      <h1>Vue 3 传统模式演示</h1>
      <p class="subtitle">使用Vue 3.4.35 + Vite 5.4.0</p>
    </header>
    
    <main class="app-main">
      <div class="demo-section">
        <h2>性能对比演示</h2>
        <p class="description">
          这是一个使用传统Vue 3响应式系统的计数器组件。
          点击按钮观察渲染次数和性能表现。
        </p>
        <TraditionalCounter />
      </div>
      
      <div class="features-section">
        <h2>传统Vue 3特点</h2>
        <div class="features-grid">
          <div class="feature-card">
            <h3>🔄 响应式系统</h3>
            <p>使用Proxy实现的响应式系统，自动追踪依赖关系</p>
          </div>
          <div class="feature-card">
            <h3>🌳 虚拟DOM</h3>
            <p>基于虚拟DOM的渲染机制，支持高效的DOM更新</p>
          </div>
          <div class="feature-card">
            <h3>📦 组件化</h3>
            <p>完整的组件系统，支持组合式API和选项式API</p>
          </div>
          <div class="feature-card">
            <h3>🛠️ 开发工具</h3>
            <p>丰富的开发工具支持，包括Vue DevTools</p>
          </div>
        </div>
      </div>
    </main>
  </div>
</template>

<script setup>
import TraditionalCounter from './components/TraditionalCounter.vue'
</script>

<style scoped>
#app1 {
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
  max-width: 1200px;
  margin: 0 auto;
  padding: 20px;
}

.app-header {
  text-align: center;
  margin-bottom: 40px;
  padding: 20px;
  background: linear-gradient(135deg, #42b883 0%, #369870 100%);
  color: white;
  border-radius: 12px;
}

.logo {
  width: 80px;
  height: 80px;
  margin-bottom: 20px;
}

.app-header h1 {
  margin: 0 0 10px 0;
  font-size: 2.5rem;
  font-weight: 300;
}

.subtitle {
  margin: 0;
  font-size: 1.1rem;
  opacity: 0.9;
}

.app-main {
  display: grid;
  gap: 40px;
}

.demo-section {
  background: white;
  padding: 30px;
  border-radius: 12px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.demo-section h2 {
  color: #42b883;
  margin-bottom: 10px;
}

.description {
  color: #666;
  line-height: 1.6;
  margin-bottom: 30px;
}

.features-section {
  background: white;
  padding: 30px;
  border-radius: 12px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.features-section h2 {
  color: #42b883;
  margin-bottom: 20px;
  text-align: center;
}

.features-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 20px;
}

.feature-card {
  padding: 20px;
  background: #f8f9fa;
  border-radius: 8px;
  border-left: 4px solid #42b883;
}

.feature-card h3 {
  margin: 0 0 10px 0;
  color: #42b883;
  font-size: 1.2rem;
}

.feature-card p {
  margin: 0;
  color: #666;
  line-height: 1.5;
}

@media (max-width: 768px) {
  .app-header h1 {
    font-size: 2rem;
  }
  
  .features-grid {
    grid-template-columns: 1fr;
  }
}
</style>

