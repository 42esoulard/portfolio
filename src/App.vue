<template>
  <link
    href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.css"
    rel="stylesheet"
    type="text/css"
  />
  <Header />
  <div class="main-container">
    <router-view class="content-container" />
    <Footer />
  </div>
</template>

<script lang="ts">
import Header from "./components/Header.vue";
import Footer from "./components/Footer.vue";

export default {
  name: "App",
  components: {
    Header,
    Footer,
  },
};
</script>

<style lang="scss">
@import "./sass/main.scss";
</style>
