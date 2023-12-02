<script setup>
import NavBar from '@/components/NavBar.vue'

import { RouterView } from 'vue-router'
import { useAuthStore } from '@/stores/authStore'

const authStore = useAuthStore()

let isLogin = sessionStorage.getItem("isLogin");
console.log("isLogin : "+isLogin)

if (isLogin == "true") {
  let userName = sessionStorage.getItem("userName");
  let userProfileImageUrl = sessionStorage.getItem("userProfileImageUrl");
  authStore.setLogin({
    isLogin: true,
    userName: userName,
    userProfileImageUrl: userProfileImageUrl
  });
}

</script>

<template>
  <div id="page-top">
    <nav-bar></nav-bar>

    <router-view></router-view>

  </div>
</template>

<style scoped>
#page-top {
  height: 100%;
}
</style>
