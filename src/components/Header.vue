<template>
  <div class="nav-container">
    <nav class="nav">
      <router-link :to="{ name: 'Home'}">Home</router-link> | 
      <router-link :to="{ name: 'About'}">About</router-link> | 
      <router-link :to="{ name: 'Work'}">Work</router-link> | 
      <router-link :to="{ name: 'Contact'}">Contact</router-link>
    </nav>
  </div>
</template>

<script>
export default {

}
</script>

<style>

</style>