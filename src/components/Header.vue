<template>
  <div class="nav-container">
    <nav class="nav">
      <div class="nav-burger" @click="openMobileNav">
        <div class="nav-burger-icon nav-burger-icon--1"/>
        <div class="nav-burger-icon nav-burger-icon--2"/>
        <div class="nav-burger-icon nav-burger-icon--3"/>
      </div>
      <div class="nav-links">
        <router-link class="[ nav-link" :to="{ name: 'Home'}" @click="openMobileNav">HOME</router-link> | 
        <router-link class="nav-link" :to="{ name: 'About'}" @click="openMobileNav">ABOUT</router-link> | 
        <router-link class="nav-link" :to="{ name: 'Work'}" @click="openMobileNav">WORK</router-link> | 
        <router-link class="nav-link" :to="{ name: 'Contact'}" @click="openMobileNav">CONTACT</router-link> | 
        <a target="_blank" href='https://github.com/42esoulard' title="GitHub: 42esoulard">
          <img class="nav-link nav-link--gh" src='../assets/github-light.png' />
        </a>
      </div>
    </nav>
  </div>
</template>

<script lang='ts'>
import { defineComponent } from "vue";

export default defineComponent({
  name: 'Header',
  setup() {
    const openMobileNav = () => {
      const burgerLines = document.querySelectorAll(".nav-burger-icon");
      const nav = document.querySelector(".nav-links");
      const links = document.querySelectorAll(".nav-link");
      if (window.innerWidth > 768) { 
        return;
      }
      if (nav) {
        if (!nav.classList.toggle("nav-links--active")) {
          nav.classList.toggle("nav-links--close")
          setTimeout(() => {
            nav.classList.toggle("nav-links--close")
          }, 300);
        }
      }
      for (let i = 1; i < 4 && burgerLines; ++i) {
        burgerLines[i - 1].classList.toggle(`nav-burger-icon--${i}--toggle`);
      }
      links.forEach((link, index) => {
        if (link.getAttribute("style")) {
          link.removeAttribute("style");
        } else {
          link.setAttribute(
            "style",
            `animation: navLinkFade 0.5s ease forwards ${index / 7 + 0.5}s`
          );
        }
      });
    }
    return {
      openMobileNav,
    }
  },
})
</script>

<style lang="scss">
  @import "../sass/main.scss";
</style>