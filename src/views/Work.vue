<template>
  <div class="work">
    <div class="work-title">Past projects</div>
    <div class="work-carousel-wrapper">
    
      <img src="" :class="[
          'work-slide-img',
          currentSlide === 0 ? 'work-slide-img--active' : '',
        ]" id="0" title="Portfolio website"/>
      <img src="" :class="[
          'work-slide-img',
          currentSlide === 1 ? 'work-slide-img--active' : '',
        ]" id="1" title="ft_transcendence"/>
      <img src="" :class="[
          'work-slide-img',
          currentSlide === 2 ? 'work-slide-img--active' : '',
        ]" id="2" title="webserv"/>
      <img src="" :class="[
          'work-slide-img',
          currentSlide === 3 ? 'work-slide-img--active' : '',
        ]" id="3" title="The Weather Sloth"/>

      <div class='work-slide-btn' id='next' title='Next' @click="nextSlide()">&#10095;</div>
      <div class='work-slide-btn' id='prev' title='Previous' @click="prevSlide()">&#10094;</div>

      <div class="work-slide-content">
        <div class="work-slide-title"> {{ currentContent.title }} </div>
        <div class="work-slide-description"> {{ currentContent.description }} </div>
        <div class="work-slide-links">
          <div v-if="currentContent.link" class="work-slide-link">
            <a href="currentContent.link"><img src="" class="work-slide-icon" title="currentContent.link" /> Visit website </a>
          </div>
          <div class="work-slide-link"> 
            <a href="currentContent.gh"><img src="" class="work-slide-icon" title="GitHub" /> See on Github</a>
          </div>
        </div>
      </div>

    </div>

    <div class='work-dots'>
      <span :class="[
            'work-dot',
            active = (currentSlide === 0),
          ]" @click="showSlide(0)"></span>
      <span :class="[
            'work-dot',
            active = (currentSlide === 1),
          ]" @click="showSlide(1)"></span>
      <span :class="[
            'work-dot',
            active = (currentSlide === 2),
          ]" @click="showSlide(2)"></span>
      <span :class="[
            'work-dot',
            active = (currentSlide === 3),
          ]" @click="showSlide(3)"></span>
    </div>
  </div>
</template>

<script>
import { ref } from 'vue';

export default {
    setup() {
    const SLIDES_NB = 4;

    const techIcons = {
      vue: "",
      webpack: "",
      sass: "",
      css: "",
      js: "",
      ts: "",
      docker: "",
      openapi: "",
      nest: "",
      postgres: "",
      cpp: "",
    }

    let currentSlide = 0;
    let timeout;

    const content = [
      {
        title: "This website [2021]",
        description: "My introduction portfolio. A responsive single-page application built from an Alpine Docker container. Complete with neon lights.",
        tech: [
          techIcons.vue,
          techIcons.ts,
          techIcons.sass,
          techIcons.docker,
          techIcons.webpack,
        ],
        link: "",
        github: "",
      },
      {
        title: "ft_transcendence [2021]",
        description: "This is the final common core project of 42 school: a fully responsive online multiplayer pong platform, with a functional chat, live viewing, friendships and blocking features, 42 API authentication, 2FA, and website admin privileges. Group project - I worked not only but mainly on the chat features. Developped with docker-compose.",
        tech: [
          techIcons.vue,
          techIcons.ts,
          techIcons.sass,
          techIcons.docker,
          techIcons.openapi,
          techIcons.nest,
          techIcons.postgres,
          techIcons.webpack,
        ],
        link: "",
        github: "",
      },
      {
        title: "webserv [2021]",
        description: "A webserver implementation, in C++. Includes requests handling, response building and file serving, customisable server configuration (inspired by NginX's config file), and CGI execution.",
        tech: [
          techIcons.css,
        ],
        link: "",
        github: "",
      },
      {
        title: "The Weather Sloth [2021]",
        description: "A responsive app exercise with OpenWeatherAPI and GiphyAPI. For refined passionates of both weather forecasts and glorious sloths.",
        tech: [
          techIcons.js,
          techIcons.css,
          techIcons.webpack,
        ],
        link: "",
        github: "",
      },
    ];

    let currentContent = ref(content[0]);

    const nextSlide = () => {
      clearTimeout(timeout);
      showSlide(currentSlide + 1);
    }

    const prevSlide = () => {
      clearTimeout(timeout);
      showSlide(currentSlide - 1);
    }

    const showSlide = (index) => {
      clearTimeout(timeout);
      
      currentSlide = index;
      if (currentSlide >= SLIDES_NB)
        currentSlide = 0;
      if (currentSlide < 0)
        currentSlide = SLIDES_NB - 1;
      
      currentContent.value = content[currentSlide];
      timeout = setTimeout(nextSlide, 5000);
    }

    return {
      nextSlide,
      prevSlide,
      currentContent,
      currentSlide,
    }
  }
}
</script>

<style lang="scss">
  @import "../sass/main.scss";
</style>