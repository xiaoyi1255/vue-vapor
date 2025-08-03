<template>
  <div class="vapor-counter">
    <h3>Vue Vapor计数器</h3>
    <div class="counter-display">
      <span class="count">{{ count }}</span>
      <span class="label">当前计数</span>
    </div>
    <div class="counter-controls">
      <button @click="increment" class="btn btn-primary">+1</button>
      <button @click="decrement" class="btn btn-secondary">-1</button>
      <button @click="reset" class="btn btn-reset">重置</button>
    </div>
    <div class="performance-info">
      <p>渲染次数: {{ renderCount }}</p>
      <p>最后更新: {{ lastUpdate }}</p>
      <p class="vapor-badge">🚀 Vapor优化</p>
    </div>
  </div>
</template>

<script setup vapor>
import { ref, onMounted, onUpdated, nextTick } from 'vue'

// 响应式数据 - Vapor模式下会有更好的性能
const count = ref(0)
const renderCount = ref(0)
const lastUpdate = ref('')

// 方法 - Vapor会优化这些方法的调用
const increment = () => {
  const startTime = performance.now()
  count.value++
  lastUpdate.value = new Date().toLocaleTimeString()
  
  // 使用nextTick确保在DOM更新后测量渲染时间
  nextTick(() => {
    const endTime = performance.now()
    const renderTime = endTime - startTime
    
    // 记录渲染时间到性能分析器
    if (window.vueAnalyzer) {
      window.vueAnalyzer.recordRenderTime('vapor', renderTime)
    }
    
    console.log(`🚀 Vapor 渲染时间: ${renderTime.toFixed(2)}ms`)
  })
}

const decrement = () => {
  const startTime = performance.now()
  count.value--
  lastUpdate.value = new Date().toLocaleTimeString()
  
  nextTick(() => {
    const endTime = performance.now()
    const renderTime = endTime - startTime
    
    if (window.vueAnalyzer) {
      window.vueAnalyzer.recordRenderTime('vapor', renderTime)
    }
    
    console.log(`🚀 Vapor 渲染时间: ${renderTime.toFixed(2)}ms`)
  })
}

const reset = () => {
  const startTime = performance.now()
  count.value = 0
  lastUpdate.value = new Date().toLocaleTimeString()
  
  nextTick(() => {
    const endTime = performance.now()
    const renderTime = endTime - startTime
    
    if (window.vueAnalyzer) {
      window.vueAnalyzer.recordRenderTime('vapor', renderTime)
    }
    
    console.log(`🚀 Vapor 渲染时间: ${renderTime.toFixed(2)}ms`)
  })
}

// 生命周期钩子
onMounted(() => {
  renderCount.value++
  lastUpdate.value = new Date().toLocaleTimeString()
})

// 使用非响应式变量跟踪渲染次数
let updateCount = 0

// 使用onUpdated来统计渲染次数
onUpdated(() => {
  updateCount++
  console.log(`🚀 Vapor 渲染次数: ${updateCount}`)
})
</script>

<style scoped>
.vapor-counter {
  padding: 20px;
  border: 2px solid #646cff;
  border-radius: 8px;
  background: #f8f9fa;
  max-width: 400px;
  margin: 20px auto;
  position: relative;
}

.vapor-counter::before {
  content: "⚡";
  position: absolute;
  top: -10px;
  right: -10px;
  background: #646cff;
  color: white;
  border-radius: 50%;
  width: 30px;
  height: 30px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 16px;
}

.counter-display {
  text-align: center;
  margin: 20px 0;
}

.count {
  font-size: 3rem;
  font-weight: bold;
  color: #646cff;
  display: block;
}

.label {
  font-size: 1rem;
  color: #666;
  margin-top: 10px;
  display: block;
}

.counter-controls {
  display: flex;
  gap: 10px;
  justify-content: center;
  margin: 20px 0;
}

.btn {
  padding: 10px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 1rem;
  transition: all 0.3s ease;
}

.btn-primary {
  background: #646cff;
  color: white;
}

.btn-primary:hover {
  background: #535bf2;
}

.btn-secondary {
  background: #ff6b6b;
  color: white;
}

.btn-secondary:hover {
  background: #e55555;
}

.btn-reset {
  background: #6c757d;
  color: white;
}

.btn-reset:hover {
  background: #5a6268;
}

.performance-info {
  margin-top: 20px;
  padding: 15px;
  background: #e9ecef;
  border-radius: 4px;
  font-size: 0.9rem;
}

.performance-info p {
  margin: 5px 0;
  color: #495057;
}

.vapor-badge {
  background: linear-gradient(45deg, #646cff, #535bf2);
  color: white;
  padding: 5px 10px;
  border-radius: 15px;
  font-size: 0.8rem;
  font-weight: bold;
  text-align: center;
  margin-top: 10px;
}
</style> 