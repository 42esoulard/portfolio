<template>
  <div class="about">
    <h1 class="about-title">About me</h1>

    <div class="about-btn-container">
      <button
        :class="['about-btn', short ? 'about-btn--active' : '']"
        @click="toggleLength('short')"
      >
        Short version
      </button>
      <button
        :class="['about-btn', short ? '' : 'about-btn--active']"
        @click="toggleLength('long')"
      >
        Long version
      </button>
    </div>

    <div v-if="short" class="about-text about-short">
      <div>
        <span class="about-short-subtitle"
          ><div class="about-line">------------</div>
          I AM
          <div class="about-line">------------</div></span
        >
        <p>28yo - Paris, France</p>

        <p>DevOps Engineer<br>@Scaleway<br>(Cloud Builder Launchpad)</p>
        <p>42 Paris alumni</p>
      </div>
      <!-- <div>
        <span class="about-short-subtitle"
          ><div class="about-line">------------</div>
          I'M LOOKING FOR
          <div class="about-line">-----------</div></span
        >
        <p>
          A first job as a software or fullstack dev <br />
          (Paris or remote)
        </p>
      </div> -->
      <div>
        <span class="about-short-subtitle"
          ><div class="about-line">------------</div>
          I'M LEARNING
          <div class="about-line">-----------</div></span
        >
        <p class="about-stack-icons">
            <a target="_blank" href='https://www.python.org/'
                ><img
                src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/python/python-original.svg"
                title='Python'
                class="about-stack-icon"
            /></a>
            <a target="_blank" href='https://go.dev/'
                ><img
                src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/go/go-original-wordmark.svg"
                title='Go'
                class="about-stack-icon"
            /></a>
            <a target="_blank" href='https://www.futurelearn.com/info/blog/introduction-to-cloud-computing'
                ><img
                src="https://www.svgrepo.com/show/92428/cloud-computing.svg"
                title='Cloud Ecosystems'
                class="about-stack-icon"
            /></a>
        </p>
      </div>

      <div>
        <span class="about-short-subtitle"
          ><div class="about-line">-----------------</div>
          I'M GOOD AT
          <div class="about-line">-----------------</div></span
        >
        <p>
          Autonomy, self-discipline, teamwork,<br />organization, self-teaching
        </p>
      </div>
      <div>
        <span class="about-short-subtitle"
          ><div class="about-line">---------------</div>
          I LOVE
          <div class="about-line">----------------</div></span
        >
        <p>
          Creating, coding, music, <br />
          personal growth, neon signs
        </p>
      </div>
    </div>

    <div v-else class="about-text about-long">
      <div class="about-column">
        <p>
          I am a <span class="about-highlight">28 years old</span> developer
          currently based in <span class="about-highlight">Paris, France</span>.
        </p>
        <p>
          I recently graduated from
          <span class="about-highlight">42Paris</span>' common core curriculum
          and I am now part of 
          <span class="about-highlight"
            >Scaleway's Cloud Builder Launchpad</span
          > as a <span class="about-highlight"
            >DevOps Engineer</span> and Cloud Builder in the making.
        </p>
        <p>
          I joined 42 back in 2019 as a complete coding beginner. In the past
          years, I have studied a wide range of technologies, and I have
          acquired an ever-growing thirst for
          <span class="about-highlight">self-teaching</span>!
        </p>
        <p>
          42's peer-learning pedagogy allowed me to acquire great
          <span class="about-highlight">teamwork</span> experience, as well as
          rigorous <span class="about-highlight">self-discipline</span>, and a
          knack for <span class="about-highlight">organization</span>.
        </p>
      </div>
      <div class="about-column">
        <p>
          Because of the health crisis, I got to experiment with remote work for
          most of 2020: I learnt to be
          <span class="about-highlight">independent</span> and to provide
          structure to my work - and my life - with
          <span class="about-highlight">flexibility</span>.
        </p>

        <p>
          I am now familiar with C and C++, algorithm building, fullstack web
          development, app containerization, server mechanics, computer science
          and networks theory, and security notions.
        </p>
        <p>
          I have always been a
          <span class="about-highlight">creator at heart</span>, and coding is
          now one of the creative mediums I affectionate the most. Another one
          very dear to my heart is music: I have been a
          <span class="about-highlight">musician</span> for as long as I can
          remember, and I am currently self-teaching drums playing.
        </p>
        <p>Also I enjoy a good neon sign.</p>
      </div>
    </div>

    <span class="about-short-subtitle"
      ><div class="about-line">---------</div>
      MY STACK
      <div class="about-line">---------</div></span
    >
    <p class="about-stack-icons">
      <a target="_blank" href="https://ubuntu.com/desktop/developers"
        ><img
          src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/ubuntu/ubuntu-plain-wordmark.svg"
          title="Ubuntu"
          class="about-stack-icon"
      /></a>
      <a target="_blank" href="https://git-scm.com/"
        ><img
          src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/git/git-original.svg"
          title="Git"
          class="about-stack-icon"
      /></a>
      <a
        target="_blank"
        href="https://www.cprogramming.com/tutorial/c-tutorial.html?inl=nv"
        ><img
          src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/c/c-original.svg"
          title="C"
          class="about-stack-icon"
      /></a>
      <a target="_blank" href="http://www.cplusplus.com/"
        ><img
          src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/cplusplus/cplusplus-original.svg"
          title="C++"
          class="about-stack-icon"
      /></a>
      <a
        target="_blank"
        href="https://developer.mozilla.org/en-US/docs/Web/HTML/Reference"
        ><img
          src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/html5/html5-original-wordmark.svg"
          title="HTML5"
          class="about-stack-icon"
      /></a>
      <a target="_blank" href="https://cssreference.io/"
        ><img
          src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/css3/css3-original-wordmark.svg"
          title="CSS3"
          class="about-stack-icon"
      /></a>
      <a target="_blank" href="https://sass-lang.com/documentation"
        ><img
          src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/sass/sass-original.svg"
          title="Sass"
          class="about-stack-icon"
      /></a>
      <a target="_blank" href="https://javascript.info/"
        ><img
          src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/javascript/javascript-original.svg"
          title="JavaScript"
          class="about-stack-icon"
      /></a>
      <a target="_blank" href="https://www.typescriptlang.org/docs/"
        ><img
          src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/typescript/typescript-original.svg"
          title="TypeScript"
          class="about-stack-icon"
      /></a>
      <a target="_blank" href="https://v3.vuejs.org/"
        ><img
          src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/vuejs/vuejs-original.svg"
          title="VueJS"
          class="about-stack-icon"
      /></a>
      <a target="_blank" href="https://docs.nestjs.com/"
        ><img
          src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/nestjs/nestjs-plain.svg"
          title="NestJS"
          class="about-stack-icon"
      /></a>
      <a target="_blank" href="https://webpack.js.org/"
        ><img
          src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/webpack/webpack-original.svg"
          title="Webpack"
          class="about-stack-icon"
      /></a>
      <a target="_blank" href="https://www.postgresql.org/"
        ><img
          src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/postgresql/postgresql-original.svg"
          title="PostgreSQL"
          class="about-stack-icon"
      /></a>
      <a target="_blank" href="http://nginx.org/en/docs/"
        ><img
          src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/nginx/nginx-original.svg"
          class="about-stack-icon"
      /></a>
      <a target="_blank" href="https://www.docker.com/"
        ><img
          src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/docker/docker-plain-wordmark.svg"
          title="Docker"
          class="about-stack-icon"
      /></a>
      <a target="_blank" href="https://kubernetes.io/"
        ><img
          src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/kubernetes/kubernetes-plain.svg"
          title="Kubernetes"
          class="about-stack-icon"
      /></a>
    </p>
    <div v-if="short" @click="toggleLength('long')" title="More">
      <i class="fa fa-chevron-down fa-3x about-more-icon"></i>
    </div>
    <div v-else @click="toggleLength('short')" title="Less">
      <i class="fa fa-chevron-up fa-3x about-more-icon"></i>
    </div>
  </div>
</template>

<script lang="ts">
import { onMounted, ref } from "vue";

export default {
  setup() {
    onMounted(() => {
      setTimeout(() => {
        window.scroll({
          top: 0,
          left: 0,
          behavior: "smooth",
        });
      }, 500);
    });
    const short = ref(true);
    let shortText: Element | null;
    let longText: Element | null;

    const toggleLength = (length: string) => {
      shortText = document.querySelector(".about-short");
      longText = document.querySelector(".about-long");
      if (length == "long" && short.value && shortText) {
        shortText.setAttribute("style", "");
        shortText.setAttribute(
          "style",
          "animation: rollToTop 1s ease forwards"
        );
        setTimeout(() => {
          short.value = false;
          longText = document.querySelector(".about-long");
          if (longText) {
            longText.setAttribute("style", "");
            longText.setAttribute(
              "style",
              "animation: rollFromTop 1s ease forwards"
            );
          }
        }, 600);
      } else if (length == "short" && !short.value && longText) {
        longText.setAttribute("style", "");
        longText.setAttribute("style", "animation: rollToTop 1s ease forwards");

        setTimeout(() => {
          short.value = true;
          shortText = document.querySelector(".about-short");
          if (shortText) {
            shortText.setAttribute("style", "");
            shortText.setAttribute(
              "style",
              "animation: rollFromTop 1s ease forwards"
            );
          }
        }, 600);
      }
      setTimeout(() => {
        window.scroll({
          top: 0,
          left: 0,
          behavior: "smooth",
        });
      }, 1500);
    };

    return {
      short,
      toggleLength,
    };
  },
};
</script>

<style lang="scss">
@import "../sass/main.scss";
</style>
