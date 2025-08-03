<template>
  <div class="traditional-counter">
    <h3>传统Vue 3计数器</h3>
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
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, onUpdated, nextTick } from 'vue'

// 响应式数据
const count = ref(0)
const renderCount = ref(0)
const lastUpdate = ref('')

// 方法
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
      window.vueAnalyzer.recordRenderTime('traditional', renderTime)
    }
    
    console.log(`📈 传统Vue 渲染时间: ${renderTime.toFixed(2)}ms`)
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
      window.vueAnalyzer.recordRenderTime('traditional', renderTime)
    }
    
    console.log(`📈 传统Vue 渲染时间: ${renderTime.toFixed(2)}ms`)
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
      window.vueAnalyzer.recordRenderTime('traditional', renderTime)
    }
    
    console.log(`📈 传统Vue 渲染时间: ${renderTime.toFixed(2)}ms`)
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
  console.log(`📈 传统Vue 渲染次数: ${updateCount}`)
})
</script>

<style scoped>
.traditional-counter {
  padding: 20px;
  border: 2px solid #42b883;
  border-radius: 8px;
  background: #f8f9fa;
  max-width: 400px;
  margin: 20px auto;
}

.counter-display {
  text-align: center;
  margin: 20px 0;
}

.count {
  font-size: 3rem;
  font-weight: bold;
  color: #42b883;
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
  background: #42b883;
  color: white;
}

.btn-primary:hover {
  background: #369870;
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
</style> 