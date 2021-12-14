<template>
  <div class="nav-container">
    <nav class="nav">
      <router-link class="[ nav-link" :to="{ name: 'Home'}">HOME</router-link> | 
      <router-link class="nav-link" :to="{ name: 'About'}">ABOUT</router-link> | 
      <router-link class="nav-link" :to="{ name: 'Work'}">WORK</router-link> | 
      <router-link class="nav-link" :to="{ name: 'Contact'}">CONTACT</router-link>
    </nav>
  </div>
</template>

<script>
export default {

}
</script>

<style>

</style>