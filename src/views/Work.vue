<template>
  <div class="work">
    <div class="work-title">Past projects</div>
    <div class='work-dots'>
      <span v-for="item in content" :key="item.id" :class="[
            'work-dot',
           currentSlide === item.id ? 'work-dot--active' : '',
          ]" @click="dotSlide(item.id)"></span>
    </div>

    <div class="work-carousel-wrapper">
      <div class='work-slide-btn work-slide-btn--prev' id='prev' title='Previous' @click="prevSlide()">&#10094;</div>
      <div class="work-carousel-content-wrapper">
        <div v-for="item in content" :key='item.id' :class="[
              'work-slide-img-wrapper',
              currentSlide === item.id ? 'work-slide-img-wrapper--active' : '',
            ]">
          <img :src="getImgUrl(item.img)" class="work-slide-img" :title="item.title"/>
          <a target="_blank" :href="item.github" class="work-slide-img-link">
            <img
              :src="getImgUrl('github-light.png')"
            />see on github
          </a>
        </div>

        <div class="work-slide-content">
          <div class="work-line">-----------------------------------------------</div>
          <div v-if="currentContent.link" class="work-slide-title"><a class="work-slide-title" target="_blank" :href="currentContent.link"> {{ currentContent.title }} </a></div>
          <div v-else class="work-slide-title"><a class="work-slide-title" target="_blank" :href="currentContent.github"> {{ currentContent.title }} </a></div>
          <!-- <div class="work-line">-------------------</div> -->
          <div class="work-slide-techs">
            <a v-for="tech in currentContent.tech" :key="tech.name" target="_blank" :href="tech.link">
              <img :src="tech.img" :title="tech.name" class="work-slide-tech"/>
            </a>
          </div>
          <div class="work-slide-description"> {{ currentContent.description }} </div>
          <div class="work-slide-links">
            <!-- <div v-if="currentContent.link" class="work-slide-link"> -->
            <!-- </div> -->
            <!-- <div class="work-slide-link">  -->
              <a target="_blank" class="work-slide-link" :href="currentContent.github">
                <img class="work-slide-icon"
                  :src="getImgUrl('github-light.png')"
                />See on github
              </a>
              <a v-if="currentContent.link" class="work-slide-link" target="_blank" :href="currentContent.link" >Visit website </a>

            <!-- </div> -->
          </div>
        </div>
      </div>
      <div class='work-slide-btn work-slide-btn--next' id='next' title='Next' @click="nextSlide()">&#10095;</div>
    </div>

  </div>
</template>

<script lang='ts'>
import { onMounted, ref } from 'vue';

export default {
    setup() {
    const SLIDES_NB = 5;

    const techIcons = {
      vue: {
        link:"https://v3.vuejs.org/",
        name:"Vue",
        img:"https://cdn.jsdelivr.net/gh/devicons/devicon/icons/vuejs/vuejs-original.svg",
      },
      webpack: {
        link:"https://webpack.js.org/",
        name:"Webpack",
        img:"https://cdn.jsdelivr.net/gh/devicons/devicon/icons/webpack/webpack-original.svg",
      },
      sass: {
        link:"https://sass-lang.com/documentation",
        name:"Sass",
        img:"https://cdn.jsdelivr.net/gh/devicons/devicon/icons/sass/sass-original.svg",
      },
      css: {
        link:"https://cssreference.io/",
        name:"CSS",
        img:"https://cdn.jsdelivr.net/gh/devicons/devicon/icons/css3/css3-original-wordmark.svg",
      },
      js: {
        link:"https://javascript.info/",
        name:"JavaScript",
        img:"https://cdn.jsdelivr.net/gh/devicons/devicon/icons/javascript/javascript-original.svg",
      },
      html: {
        link: "https://developer.mozilla.org/en-US/docs/Web/HTML/Reference",
        name: "HTML",
        img: "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/html5/html5-original-wordmark.svg",
      },
      ts: {
        link:"https://www.typescriptlang.org/docs/",
        name:"TypeScript",
        img:"https://cdn.jsdelivr.net/gh/devicons/devicon/icons/typescript/typescript-original.svg",
      },
      docker: {
        link:"https://www.docker.com/",
        name:"Docker",
        img:"https://cdn.jsdelivr.net/gh/devicons/devicon/icons/docker/docker-plain-wordmark.svg",
      },
      openapi: {
        link:"https://swagger.io/specification/",
        name:"OpenAPI",
        img:"https://www.vectorlogo.zone/logos/openapis/openapis-icon.svg",
      },
      nest: {
        link:"https://docs.nestjs.com/",
        name:"NestJS",
        img:"https://cdn.jsdelivr.net/gh/devicons/devicon/icons/nestjs/nestjs-plain.svg",
      },
      postgres: {
        link:"https://www.postgresql.org/",
        name:"PostgreSQL",
        img:"https://cdn.jsdelivr.net/gh/devicons/devicon/icons/postgresql/postgresql-original.svg",
      },
      cpp: {
        link:"http://www.cplusplus.com/",
        name:"C++",
        img:"https://cdn.jsdelivr.net/gh/devicons/devicon/icons/cplusplus/cplusplus-original.svg",
      },
      c: {
        link:"https://www.cprogramming.com/tutorial/c-tutorial.html?inl=nv",
        name:"C",
        img:"https://cdn.jsdelivr.net/gh/devicons/devicon/icons/c/c-original.svg",
      },
    }

    const getImgUrl = (name: string) => {
      return require(`../assets/${name}`);
    }

    const content = [
      {
        id: 0,
        title: "This website [2021]",
        img: "portfolio.png",
        description: "My introduction portfolio. A responsive single-page application built from a Node based Docker container. Complete with neon lights.",
        tech: [
          techIcons.vue,
          techIcons.sass,
          techIcons.ts,
          techIcons.docker,
        ],
        link: "",
        github: "https://github.com/42esoulard/portfolio",
      },
      {
        id: 1,
        title: "ft_transcendence [2021]",
        img: "ft_transcendence.gif",
        description: "A fully responsive online multiplayer pong platform, with a functional chat, live view, social features, 42 API authentication, 2FA, and website admin privileges. Group project, developed with docker-compose.",
        tech: [
          techIcons.vue,
          techIcons.sass,
          techIcons.ts,
          techIcons.nest,
          techIcons.postgres,
          techIcons.openapi,
          techIcons.docker,
        ],
        link: "",
        github: "https://github.com/42esoulard/42_ft_transcendence",
      },
      {
        id: 2,
        title: "webserv [2021]",
        img: "webserv.png",
        description: "An HTTP 1.1 server in C++ 98, according to RFC and inspired by Nginx (GET, POST, DELETE, PUT methods). Includes requests handling, response building and file serving, customisable server configuration, and CGI execution.",
        tech: [
          techIcons.cpp,
        ],
        link: "",
        github: "https://github.com/42esoulard/42_webserv",
      },
      {
        id: 3,
        title: "The Weather Sloth [2021]",
        img: "sloth.png",
        description: "A responsive app exercise with OpenWeatherAPI and GiphyAPI. For refined passionates of both weather forecasts and glorious sloths.",
        tech: [
          techIcons.html,
          techIcons.css,
          techIcons.js,
          techIcons.webpack,
        ],
        link: "https://42esoulard.github.io/weather_sloth/",
        github: "https://github.com/42esoulard/weather_sloth",
      },
      {
        id: 4,
        title: "miniRT [2020]",
        img: "minirt.png",
        description: "A multi-threaded raytracer in C. Rendering computer-generated-images from a parsed configuration file, implementing geometry formulas.",
        tech: [
          techIcons.c,
        ],
        link: "",
        github: "https://github.com/42esoulard/42_minirt",
      },
    ];

    let currentContent = ref(content[0]);
    let currentSlide = ref(0);
    let carousel: Element | null;

    onMounted(() => {
      setTimeout(() => {
        window.scroll({
          top: 0, 
          left: 0, 
          behavior: 'smooth'
        });
      }, 500)
   
      carousel = document.querySelector(".work-carousel-content-wrapper");
    })

    
    const nextSlide = () => {
      
      if (!carousel)
        return;
      carousel.setAttribute("style", "")
      carousel.setAttribute("style", "animation: rightSlideOut 1s ease forwards");
      setTimeout(() => {
        showSlide(currentSlide.value + 1);
        if (!carousel)
          return;
        carousel.setAttribute("style", "")
        carousel.setAttribute("style", "animation: rightSlideIn 1s ease forwards");
      }, 300)
    }

    const prevSlide = () => {
      if (!carousel)
        return;
      carousel.setAttribute("style", "")
      carousel.setAttribute("style", "animation: leftSlideOut 1s ease forwards");
      setTimeout(() => {
        showSlide(currentSlide.value - 1);
        if (!carousel)
          return;
        carousel.setAttribute("style", "")
        carousel.setAttribute("style", "animation: leftSlideIn 1s ease forwards");
      }, 300)
    }

    let dotTravel = false;

    const dotSlide = async (index: number) => {
      if (dotTravel) {
        return;
      }
      dotTravel = true;
      let counter;

      if (currentSlide.value < index) {
        counter = index - currentSlide.value;
        while (counter--) {
          nextSlide();
        }
      } else if (currentSlide.value > index) {
        counter = currentSlide.value - index;
        while (counter--) {
          prevSlide();
        }
      }
      dotTravel = false;
    }

    const showSlide = (index: number) => {      
      currentSlide.value = index;
      if (currentSlide.value >= SLIDES_NB)
        currentSlide.value = 0;
      if (currentSlide.value < 0)
        currentSlide.value = SLIDES_NB - 1;
      
      currentContent.value = content[currentSlide.value];
    }

    return {
      content,
      getImgUrl,
      nextSlide,
      prevSlide,
      dotSlide,
      currentContent,
      currentSlide,
    }
  }
}
</script>

<style lang="scss">
  @import "../sass/main.scss";
</style>