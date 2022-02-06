import { createApp } from "vue";
import App from "./App.vue";
import router from "./router";
import VueRecaptcha from "vue3-recaptcha-v2";

createApp(App)
  .use(router)
  .use(VueRecaptcha, {
    siteKey: "6Lfx2dEdAAAAAGiLzMZI6ES8SvgOFAg8IEbRjOXJ",
    alterDomain: false, // default: false
  })
  .mount("#app");
