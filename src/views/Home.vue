<template>
  <div class='home'>
    <div class="home-neon-pretext">Hi, I'm</div>
    <div class="home-neon-wrapper">
      <router-link  class="home-neon-text" :to="{ name: 'About'}">Est<span class="home-neon-text--offset">el</span>l<span class="home-neon-text--offset">e</span></router-link>
    </div>
    <div class="home-subtitle"><router-link :to="{ name: 'Work'}" class="home-subtitle--dev">a &lt;dev&gt;</router-link><span class="home-subtitle--neon"> who likes neon signs</span></div>

  </div>
</template>

<script>
export default {

}
</script>

<style lang="scss">
  @import "../sass/main.scss";
</style>