<script setup vapor>
import { ref, onMounted } from 'vue'

const count = ref(0)

const increment = () => {
  count.value++
}

onMounted(() => {
  console.log('Vapor mounted')
})
</script>


<template>
  <div>
    <h1>Vapor</h1>
    <button @click="increment">Increment</button>
    <p>Count: {{ count }}</p>
  </div>
</template>
