<script setup>
import { ref } from 'vue'
import { useRoute } from 'vue-router'
import { useAuthStore } from '@/stores/authStore'

const { authStore, logout } = useAuthStore()
const router = useRoute()

const removeBarBackground = ref(false)

// 내비게이션 스크립트 이벤트
window.addEventListener('DOMContentLoaded', (event) => {
  // Navbar shrink function
  var navbarShrink = function () {
    const navbarCollapsible = document.body.querySelector('#mainNav')
    if (!navbarCollapsible) {
      return
    }
    if (window.scrollY === 0) {
      navbarCollapsible.classList.remove('navbar-shrink')
    } else {
      navbarCollapsible.classList.add('navbar-shrink')
    }
  }

  // Shrink the navbar
  navbarShrink()

  // Shrink the navbar when page is scrolled
  document.addEventListener('scroll', navbarShrink)

  // Activate Bootstrap scrollspy on the main nav element
  const mainNav = document.body.querySelector('#mainNav')
  if (mainNav) {
    new bootstrap.ScrollSpy(document.body, {
      target: '#mainNav',
      rootMargin: '0px 0px -40%'
    })
  }

  // Collapse responsive navbar when toggler is visible
  const navbarToggler = document.body.querySelector('.navbar-toggler')
  const responsiveNavItems = [].slice.call(document.querySelectorAll('#navbarResponsive .nav-link'))
  responsiveNavItems.map(function (responsiveNavItem) {
    responsiveNavItem.addEventListener('click', () => {
      if (window.getComputedStyle(navbarToggler).display !== 'none') {
        navbarToggler.click()
      }
    })
  })

  // Activate SimpleLightbox plugin for portfolio items
  new SimpleLightbox({
    elements: '#portfolio a.portfolio-box'
  })
})
</script>

<template>
  <!-- Navigation-->
  <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
    <div class="container px-4 px-lg-5">
      <!-- 로고 -->
      <div class="col-2">
        <a class="navbar-brand" href="/">TRIP MARK</a>
      </div>

      <!-- 모바일 토글 버튼 -->
      <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse"
        data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
        aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarResponsive">
        <!-- 메뉴 버튼 -->
        <ul class="navbar-nav mx-auto my-2 my-lg-0">
          <li class="nav-item"><router-link class="nav-link" to="/">Home</router-link></li>
          <li class="nav-item"><router-link class="nav-link" to="/place">Place</router-link></li>
          <li class="nav-item"><router-link class="nav-link" to="/social">Social</router-link></li>
          <li class="nav-item"><router-link class="nav-link" to="/makeplan">Make Plan</router-link></li>
        </ul>

        <!-- 로그인 버튼 -->
        <div class="col-2 justify-content-end" v-if="!authStore.isLogin">
          <router-link class="nav-item login-button float-end" to="/login">Login</router-link>
        </div>

        <!-- 로그아웃 버튼 -->
        <div class="d-flex col-2 justify-content-end" v-if="authStore.isLogin">
          <img v-bind:src="authStore.userProfileImageUrl" alt="profile" class="profile-image mt-1 mx-2">
          <div class="nav-item login-button" @click="logout">Logout</div>
        </div>


      </div>
    </div>
  </nav>
</template>

<style scoped>
/* .navbar {
  background-color: #f4623a;
} */

.profile-image {
  height: 24px;
  border-radius: 50%;
}

.login-button {
  cursor: pointer;
  color: #f4623a;
  padding-top: 4px;
  text-decoration: none;
  font-size: 18px;
  font-weight: 700;
}

.login-button:hover {
  color: #f38c70;
}

.navbar-brand b {
  color: #f4623a;
}
</style>
