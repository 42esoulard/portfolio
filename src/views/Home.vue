<template>
  <div class='home'>
    
    <div class="home-neon-pretext">Hi, I'm</div>
    <div class="home-neon-wrapper">
      <router-link  class="home-neon-text" :to="{ name: 'About'}">Estell<span class="home-neon-text--offset">e</span></router-link>
    </div>
    <div class="home-subtitle"><router-link :to="{ name: 'Work'}" class="home-subtitle home-subtitle--dev">a &lt;dev&gt;</router-link>
    <router-link :to="{ name: 'Contact'}" class="home-hire-me-wrapper">
      <div class="home-hire-me">Hire me</div>
    </router-link>
    <span > who likes neon signs</span></div>

  </div>
</template>

<script lang='ts'>

export default {
}
</script>

<style lang="scss">
  @import "../sass/main.scss";
</style>