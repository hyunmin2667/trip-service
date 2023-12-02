<script setup>
import AppFooter from '../components/AppFooter.vue';
</script>

<template>
  <!-- Masthead-->
  <header class="masthead">
    <div class="container px-4 px-lg-5 h-100">
      <div class="row gx-4 gx-lg-5 h-100 align-items-center justify-content-center text-center">



        <div class="col-lg-8 align-self-end">
          <div class="plane-container p-4" style="width:10rem">
            <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px"
              y="0px" width="1131.53px" height="379.304px" viewBox="0 0 1131.53 379.304"
              enable-background="new 0 0 1131.53 379.304" xml:space="preserve" class="plane">
              <polygon fill="#FFF"
                points="72.008,0 274.113,140.173 274.113,301.804 390.796,221.102 601.682,367.302 1131.53,0.223  " />
              <polygon fill="#D8D8D8" points="1131.53,0.223 274.113,140.173 274.113,301.804 390.796,221.102   " />
            </svg>
          </div>
          <h1 class="text-white font-weight-bold">함께 떠나는 여행</h1>
          <hr class="divider" />
        </div>
        <div class="col-lg-8 align-self-baseline">
          <p class="text-white-75 mb-5">어디론가 떠나고 싶은가요?<br>지금도 많은 사람들이 여행을 떠나고 있어요</p>
          <a class="btn btn-primary btn-xl" href="/board">Find Out More</a>
          <!-- <dotlottie-player class="airplane"
            src="https://lottie.host/c17f10f1-cf77-4873-bb78-daa1eb2a616c/GkHXS07zEZ.json" background="transparent"
            speed="1" direction="1" mode="normal" loop autoplay></dotlottie-player> -->
          
          <!-- paper airplane -->
          

        </div>
      </div>
    </div>
  </header>


  
  <app-footer></app-footer>
</template>

<style scoped>
header.masthead {
  padding-top: 10rem;
  padding-bottom: calc(10rem - 4.5rem);
  background: linear-gradient(to bottom, rgba(92, 77, 66, 0.200) 0%, rgba(92, 77, 66, 0.8) 100%), url(/img/bg-masthead.jpg);
  background-position: center;
  background-repeat: no-repeat;
  background-attachment: scroll;
  background-size: cover;
}



/* 이미지 미리 다운로드 */
body::after {
  /* 소스만 다운받고 화면은 나태내지 않는다. (숨김 처리) */
  position: absolute;
  width: 0;
  height: 0;
  overflow: hidden;
  z-index: -1;

  /* load images */
  content: url(/img/bg-masthead.jpg);
  /* 필요한 이미지 소스들 다운 */
}



/* 애니메이션 */
.airplane {
  height: 15rem;
}

html,
body {
  background-color: #85b9dd;
  margin: 0;
  padding: 0;
  width: 100%;
  height: 100%;
}


.plane-container svg {
  max-width: 100%;
  height: auto;
  display: block;
}

/**
 * Paper Plane
 */
/*Paper Plane: Container*/
.plane-container {
  width: 200px;
  margin: 0px auto;
  z-index: 3;
}
 /*Paper Plane: Image*/
.plane {
  width: 100%;
  height: 60px;
}

/*Paper Plane: Animation*/
.plane-container {
  -webkit-animation: paper-plane-scoping 2s alternate infinite;
  -moz-animation: paper-plane-scoping 2s alternate infinite;
  animation: paper-plane-scoping 2s alternate infinite;

  -webkit-animation-timing-function: linear;
  -moz-animation-timing-function: linear;
  animation-timing-function: linear;
}

@-webkit-keyframes paper-plane-scoping {
  0% {
    -webkit-transform: translateY(0px);
    -moz-transform: translateY(0px);
    transform: translateY(0px);
  }
  100% {
    -webkit-transform: translateY(15px);
    -moz-transform: translateY(15px);
    transform: translateY(15px);
  }
}

.plane {
  -webkit-animation-timing-function: ease-in-out;
  -moz-animation-timing-function: ease-in-out;
  animation-timing-function: ease-in-out;

  -webkit-animation: paper-plane-soaring 4s forwards infinite;
  -moz-animation: paper-plane-soaring 4s forwards infinite;
  animation: paper-plane-soaring 4s forwards infinite;
}
@-webkit-keyframes paper-plane-soaring {
  0% {
    -webkit-transform: rotate(0deg);
    -moz-transform: rotate(0deg);
    transform: rotate(0deg);
  }
  50% {
    -webkit-transform: rotate(10deg);
    -moz-transform: rotate(10deg);
    transform: rotate(10deg);
  }
  70% {
    -webkit-transform: rotate(-10deg);
    -moz-transform: rotate(-10deg);
    transform: rotate(-10deg);
  }
  100% {
    -webkit-transform: rotate(0deg);
    -moz-transform: rotate(0deg);
    transform: rotate(0deg);
  }
}







.floating {
  animation-name: floating;
  animation-duration: 3s;
  animation-iteration-count: infinite;
  animation-timing-function: ease-in-out;
}

@keyframes floating {
  0% {
    transform: translate(0, 0px);
  }

  50% {
    transform: translate(0, -10px);
  }

  100% {
    transform: translate(0, -0px);
  }
}</style>