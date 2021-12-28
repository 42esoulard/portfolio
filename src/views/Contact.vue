<template>
<div class="contact">
  <h1 class="contact-title">Contact me</h1>
  <a target="_blank" href='https://github.com/42esoulard'>
    <img class="contact-gh-link" src='../assets/github-light.png' />
  </a>
  <form class="contact-form" @submit.prevent="sendMessage()">
    <label class="contact-label" for="from_name"><span class="about-line">-----</span>NAME<span class="about-line">-----</span></label>
    <input class="contact-input" name="from_name" id="name" minlength="1" maxlength="100"  v-model="from_name">
    <label class="contact-label" for="from_email"><span class="about-line">-----</span>EMAIL<span class="about-line">-----</span></label>
    <input class="contact-input" name="from_email" id="email" type="email" minlength="2" maxlength="100" v-model="from_email" @input="checkEmail()">
    <label class="contact-label" for="message"><span class="about-line">-----</span>MESSAGE<span class="about-line">-----</span></label>
    <textarea class="contact-input contact-input--message" id="message" name="message" minlength="1" maxlength="100000" v-model="message"></textarea>
    
    <vue-recaptcha
        theme="dark"
        size="normal"
        :tabindex="0"
        @widgetId="recaptchaWidget = $event"
        @verify="callbackVerify($event)"
        @expired="callbackExpired()"
        @fail="callbackFail()"
      />
    <div v-if="robot && captchaErr" class="contact-err"> {{ captchaErr }} </div>
    
    <div class="contact-btn-neon-wrapper">
      <div class="contact-btn-neon-text" @click="sendMessage()">Send</div>
    </div>
  </form>
</div>
</template>
 
<script lang='ts'>
import { defineComponent, onMounted, ref } from "vue";
import emailjs from 'emailjs-com';
import * as EmailValidator from 'email-validator';
import { VueRecaptcha, useRecaptcha } from "vue3-recaptcha-v2";

export default defineComponent({
  name: "Contact",
  components: { VueRecaptcha },
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

    const checkName = () => {
      const nameElem: HTMLInputElement | null = document.querySelector("input#name");

      if (!nameElem) {
        return false;
      }
      valid = true;
      if (!nameElem.value) {
        nameElem.setCustomValidity("Please enter your name");
        valid = false;
      } else {
        nameElem.setCustomValidity("");
      }
      nameElem.reportValidity();
      return valid;
    }

    const checkMessage = () => {
      const msgElem: HTMLInputElement | null = document.querySelector("textarea#message");

      if (!msgElem) {
        return false;
      }
      valid = true;
      if (!msgElem.value) {
        msgElem.setCustomValidity("Please enter your message");
        valid = false;
      } else {
        msgElem.setCustomValidity("");
      }
      msgElem.reportValidity();
      return valid;
    }

    let robot = ref(true);
    let captchaErr = ref("");

    const getTopOffset = (controlEl: HTMLElement): number => {
      const labelOffset = 50;
      return controlEl.getBoundingClientRect().top + window.scrollY - labelOffset;
    }

    const scrollToInvalid = () => {
      const invalidInputs: HTMLElement[] = Array.from(document.querySelectorAll(':invalid'));    // set up so you can use any custom invalid classes you're adding to your elements, as well
      window.scroll({
        top: getTopOffset(invalidInputs[0]),
        left: 0,
        behavior: "smooth"
      });
  }

    const sendMessage = () => {
      if (wasSubmitted.value || !checkName() || !checkEmail() || !checkMessage()) {
        scrollToInvalid();
        return;
      }
      if (robot.value) {
        captchaErr.value = "Please confirm you're not a robot";
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
      // callbackVerify();
      // insert awesome mailing function
      emailjs.sendForm('service_hhok2yf', 
        'template_nsiagyv', 
        form,
        'user_YCrP2bhByVHaELW7KgZCH')
      .then((res) => {
        console.log(res.text);
        from_name.value = "";
        from_email.value = "";
        message.value = "";
        btn.textContent = "Sent!"
        setTimeout(() => {
          btn.textContent = "Send";
          wasSubmitted.value = false;
        }, 3000);
      })
      .catch((err) => {
        console.log(err.text);
        btn.textContent = "Error :(";
        setTimeout(() => {
          btn.textContent = "Send";
          wasSubmitted.value = false;
        }, 3000);
      }
    );
      // followed by confirmation modal
    }

    // Reset Recaptcha
    const { resetRecaptcha } = useRecaptcha();
    const recaptchaWidget = ref(null);
    const callbackVerify = (res: string) => {
      if (res) {
        robot.value = false;
      }
    };
    const callbackExpired = () => {
      console.log("expired!");
    };
    const callbackFail = () => {
      console.log("fail");
    };
    // Reset Recaptcha action
    const actionReset = () => {

      if (recaptchaWidget.value) resetRecaptcha(Number(recaptchaWidget.value));
    };
    return {
      recaptchaWidget,
      callbackVerify,
      callbackFail,
      callbackExpired,
      actionReset,
      from_name,
      from_email,
      message,
      sendMessage,
      checkEmail,
      robot,
      captchaErr
    }
  }
})
</script>

<style lang="scss">
  @import "../sass/main.scss";
</style>