<script setup>
import { defineProps } from 'vue'

// Properties provided by the controller
defineProps({
  message: String
})

</script>

<template>
  <div>
      <!-- Add tailwind class to our header -->
      <h1 class="bg-red-500">Dashboard</h1>
      <p> {{ message }} </p>
  </div>
</template>