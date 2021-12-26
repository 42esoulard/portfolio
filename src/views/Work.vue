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
          <div v-if="currentContent.link" class="work-slide-title"><a class="work-slide-title" :href="currentContent.link"> {{ currentContent.title }} </a></div>
          <div v-else class="work-slide-title"><a class="work-slide-title" :href="currentContent.github"> {{ currentContent.title }} </a></div>
          <!-- <div class="work-line">-------------------</div> -->
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
              <a v-if="currentContent.link" class="work-slide-link" :href="currentContent.link" >Visit website </a>

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
      // <a href='https://ubuntu.com/desktop/developers'><img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/ubuntu/ubuntu-plain-wordmark.svg" title='Ubuntu' width=50/></a>
      // <a href='https://git-scm.com/'><img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/git/git-original.svg" title='Git' width=50/></a>
      // <a href='https://www.cprogramming.com/tutorial/c-tutorial.html?inl=nv'><img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/c/c-original.svg" title='C' width=50/></a>
      // <a href='http://www.cplusplus.com/'><img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/cplusplus/cplusplus-original.svg" title='C++' width=50/></a>
      // <a href='https://developer.mozilla.org/en-US/docs/Web/HTML/Reference'><img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/html5/html5-original-wordmark.svg" title='HTML5' width=50/></a>
      // <a href='https://cssreference.io/'><img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/css3/css3-original-wordmark.svg" title='CSS3' width=50/></a>
      // <a href='https://sass-lang.com/documentation'><img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/sass/sass-original.svg" title='Sass' width=50/></a>
      // <a href='https://javascript.info/'><img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/javascript/javascript-original.svg" title='JavaScript' width=50/></a>
      // <a href='https://www.typescriptlang.org/docs/'><img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/typescript/typescript-original.svg" title='TypeScript' width=50/></a>
      // <a href='https://v3.vuejs.org/'><img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/vuejs/vuejs-original.svg" title='VueJS' width=50/></a>
      // <a href='https://docs.nestjs.com/'><img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/nestjs/nestjs-plain.svg" title='NestJS' width=50/></a>
      // <a href='https://webpack.js.org/'><img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/webpack/webpack-original.svg" title='Webpack' width=50/></a>
      // <a href='https://www.postgresql.org/'><img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/postgresql/postgresql-original.svg" title='PostgreSQL' width=50/></a>
      // <a href='http://nginx.org/en/docs/'><img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/nginx/nginx-original.svg" width=50/></a>
      // <a href='https://www.docker.com/'><img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/docker/docker-plain-wordmark.svg" title='Docker' width=50/></a>
      // <a href='https://kubernetes.io/'><img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/kubernetes/kubernetes-plain.svg" title='Kubernetes' width=50/></a>
    const techIcons = {
      vue: {
        link:"",
        name:"",
        img:"",
      },
      webpack: {
        link:"",
        name:"",
        img:"",
      },
      sass: {
        link:"",
        name:"",
        img:"",
      },
      css: {
        link:"",
        name:"",
        img:"",
      },
      js: {
        link:"",
        name:"",
        img:"",
      },
      ts: {
        link:"",
        name:"",
        img:"",
      },
      docker: {
        link:"",
        name:"",
        img:"",
      },
      openapi: {
        link:"",
        name:"",
        img:"",
      },
      nest: {
        link:"",
        name:"",
        img:"",
      },
      postgres: {
        link:"",
        name:"",
        img:"",
      },
      cpp: {
        link:"",
        name:"",
        img:"",
      },
      c: {
        link:"",
        name:"",
        img:"",
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
          techIcons.ts,
          techIcons.sass,
          techIcons.docker,
          techIcons.webpack,
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
          techIcons.ts,
          techIcons.sass,
          techIcons.docker,
          techIcons.openapi,
          techIcons.nest,
          techIcons.postgres,
          techIcons.webpack,
        ],
        link: "",
        github: "https://github.com/42esoulard/42_ft_transcendence",
      },
      {
        id: 2,
        title: "webserv [2021]",
        img: "webserv.png",
        description: "An HTTP 1.1 server in C++ 98, according to RFC and based on Nginx (GET, POST, DELETE, PUT methods). Includes requests handling, response building and file serving, customisable server configuration (inspired by NginX's config file), and CGI execution.",
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
          techIcons.js,
          techIcons.css,
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
      const timer = (ms: number) => new Promise(res => setTimeout(res, ms));

      if (currentSlide.value < index) {
        counter = index - currentSlide.value;
        while (counter--) {
          nextSlide();
          await timer(800);
        }
      } else if (currentSlide.value > index) {
        counter = currentSlide.value - index;
        while (counter--) {
          prevSlide();
          await timer(800);
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