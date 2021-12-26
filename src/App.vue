<template>
  <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.css" 
    rel="stylesheet"  type='text/css'>
  <Header />
    <router-view class="content-container"/>
</template>

<script lang='ts'>
import Header from "./components/Header.vue"

export default {
  name: 'App',
  components: {
    Header,
  }
}
</script>

<style lang="scss">
  @import "./sass/main.scss";
</style>
