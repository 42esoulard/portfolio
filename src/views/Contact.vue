<template>
  <h1 class="contact-title">Contact me</h1>

  <form @submit.prevent="sendMessage()">
    <label for="name">Your name:</label>
    <input name="name" minlength="2" maxlength="100"  v-model="name">
    <label for="email">Your email address:</label>
    <input name="email" type="email" minlength="2" maxlength="100" v-model="email">
    <label for="message">Your message:</label>
    <input name="message" minlength="2" maxlength="100000" v-model="message">
    <button type="submit">Send it my way!</button>
  </form>
</template>
 
<script>
export default {
  setup() {
    const name = ref("");
    const email = ref("");
    const message = ref("");
    const wasSubmitted = ref(false);

    const sendMessage = () => {
      if (wasSubmitted) {
        return;
      }
      wasSubmitted.value = true;
      
      // insert awesome mailing function
      // followed by confirmation modal

      name = "";
      email = "";
      message = "";
    }

    return {
      sendMessage,
    }
  }
}
</script>

<style>

</style>