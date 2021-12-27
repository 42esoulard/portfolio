<template>
<div class="contact">
  <h1 class="contact-title">Contact me</h1>

  <form class="contact-form" @submit.prevent="sendMessage()">
    <label class="contact-label" for="from_name"><span class="about-line">-----</span>NAME<span class="about-line">-----</span></label>
    <input class="contact-input" name="from_name" minlength="2" maxlength="100"  v-model="from_name">
    <label class="contact-label" for="from_email"><span class="about-line">-----</span>EMAIL<span class="about-line">-----</span></label>
    <input class="contact-input" name="from_email" id="email" type="email" minlength="2" maxlength="100" v-model="from_email" @input="checkEmail()">
    <label class="contact-label" for="message"><span class="about-line">-----</span>MESSAGE<span class="about-line">-----</span></label>
    <textarea class="contact-input contact-input--message" name="message" minlength="2" maxlength="100000" v-model="message"></textarea>
    <div class="contact-btn-neon-wrapper">
      <div class="contact-btn-neon-text" @click="sendMessage()">Send</div>
    </div>
  </form>
</div>
</template>
 
<script lang='ts'>
import { onMounted, ref } from "vue";
import emailjs from 'emailjs-com';
import * as EmailValidator from 'email-validator';

export default {
  setup() {
    onMounted(() => {
      setTimeout(() => {
        window.scroll({
          top: 0, 
          left: 0, 
          behavior: 'smooth'
        });
      }, 500)
    })

    const from_name = ref("");
    const from_email = ref("");
    const message = ref("");
    const wasSubmitted = ref(false);
    let valid = true;

    const checkEmail = () => {
      const emailElem: HTMLInputElement | null = document.querySelector("input#email");

      if (!emailElem) {
        return false;
      }

      if (!EmailValidator.validate(from_email.value)) {
        emailElem.setCustomValidity("Please enter a valid email adress");
        valid = false;
      } else {
        emailElem.setCustomValidity("");
        valid = true;
      }
      emailElem.reportValidity();
      return valid;
    }

    const sendMessage = () => {
      if (wasSubmitted.value || !checkEmail()) {
        return;
      }
      wasSubmitted.value = true;

      const form: HTMLFormElement | null = document.querySelector(".contact-form");
      if (!form) {
        return;
      }
      console.log(form)
      const btn = document.querySelector(".contact-btn-neon-text");
      if (!btn) {
        return;
      }

      // insert awesome mailing function
      emailjs.sendForm('service_hhok2yf', 
        'template_nsiagyv', 
        form,
        'user_YCrP2bhByVHaELW7KgZCH')
      .then((res) => {
        console.log(res.text);
        btn.textContent = "Sent!"
      })
      .catch((err) => {
        console.log(err.text);
        btn.textContent = "Error :("
      }
    );
      // followed by confirmation modal

      from_name.value = "";
      from_email.value = "";
      message.value = "";
      wasSubmitted.value = false;
    }

    return {
      from_name,
      from_email,
      message,
      sendMessage,
      checkEmail,

    }
  }
}
</script>

<style lang="scss">
  @import "../sass/main.scss";
</style>