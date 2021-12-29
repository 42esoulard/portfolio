<template>
  <div class='home'>
    
    <div class="home-neon-pretext">Hi, I'm</div>
    <div class="home-neon-wrapper">
      <router-link  class="home-neon-text" :to="{ name: 'About'}" title="About">Est<span class="home-neon-text--offset">el</span>l<span class="home-neon-text--offset">e</span></router-link>
    </div>
    <div class="home-subtitle"><router-link :to="{ name: 'Work'}" class="home-subtitle home-subtitle--dev" title="Work">a &lt;dev&gt;</router-link>
    <router-link :to="{ name: 'Contact'}" class="home-hire-me-wrapper" @mouseleave="transition">
      <div class="home-hire-me" title="Contact">H<span class="home-hire-me--offset">i</span>re <span class="home-hire-me--offset">m</span>e</div>
    </router-link>
    <span > who likes neon signs</span></div>

  </div>
</template>

<script lang='ts'>
import { onMounted } from '@vue/runtime-core';

export default {
  setup() {
    let hireBtn: Element | null;
    onMounted(() => {
      hireBtn = document.querySelector(".home-hire-me-wrapper");
    })

    const transition = () => {
      if (!hireBtn) {
        return;
      }
      console.log('here')
      // hireBtn.classList.remove('home-hire-me-wrapper--mouseleave');
      hireBtn.classList.add('home-hire-me-wrapper--mouseleave');
    }
    return {
      transition,
    }
  }
}
</script>

<style lang="scss">
  @import "../sass/main.scss";
</style>