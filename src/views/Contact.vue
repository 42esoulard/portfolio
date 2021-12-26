<template>
<div class="contact">
  <h1 class="contact-title">Contact me</h1>

  <form class="contact-form" @submit.prevent="sendMessage()">
    <label class="contact-label" for="name"><span class="about-line">-----</span>NAME<span class="about-line">-----</span></label>
    <input class="contact-input" name="name" minlength="2" maxlength="100"  v-model="name">
    <label class="contact-label" for="email"><span class="about-line">-----</span>EMAIL<span class="about-line">-----</span></label>
    <input class="contact-input" name="email" type="email" minlength="2" maxlength="100" v-model="email">
    <label class="contact-label" for="message"><span class="about-line">-----</span>MESSAGE<span class="about-line">-----</span></label>
    <textarea class="contact-input contact-input--message" name="message" minlength="2" maxlength="100000" v-model="message"></textarea>
    <div class="contact-btn-neon-wrapper">
      <div class="contact-btn-neon-text" @click="sendMessage()">Send</div>
    </div>
  </form>
</div>
</template>
 
<script lang='ts'>
import { ref } from "vue";

export default {
  setup() {
    const name = ref("");
    const email = ref("");
    const message = ref("");
    const wasSubmitted = ref(false);

    const sendMessage = () => {
      if (wasSubmitted.value) {
        return;
      }
      wasSubmitted.value = true;
      
      // insert awesome mailing function
      // followed by confirmation modal

      name.value = "";
      email.value = "";
      message.value = "";
    }

    return {
      name,
      email,
      message,
      sendMessage,

    }
  }
}
</script>

<style lang="scss">
  @import "../sass/main.scss";
</style>