import { reactive } from 'vue'
import { defineStore } from 'pinia'
import { useRouter } from 'vue-router'
import http from '@/common/axios.js'
import noProfileImage from '/img/noprofile.png'

export const useAuthStore = defineStore('authStore', () => {
  const router = useRouter()
  console.log(noProfileImage)
  const authStore = reactive({
    // NavBar
    isLogin: false,

    userName: '',
    userProfileImageUrl: noProfileImage,

    // Login
    userId: 'hong@gmail.com',
    userPassword: '1234'
  })

  // getter 는 생략 직접 사용하는 걸로
  const setLogin = (payload) => {
    sessionStorage.setItem('isLogin', 'true')
    sessionStorage.setItem('userName', payload.userName)
    sessionStorage.setItem('userProfileImageUrl', payload.userProfileImageUrl)

    authStore.isLogin = payload.isLogin
    authStore.userName = payload.userName
    authStore.userProfileImageUrl = payload.userProfileImageUrl
    // console.log(authStore)
  }

  const logout = async () => {
    try {
      let { data } = await http.get('/logout')

      if (data.result == 'success') {
        setLogout()
        router.push("/")
      }
    } catch (error) {
      console.error(error)
    }
  }

  const setLogout = () => {
    sessionStorage.removeItem('isLogin')
    sessionStorage.removeItem('userName')
    sessionStorage.removeItem('userProfileImageUrl')

    authStore.isLogin = false
    authStore.userName = ''
    authStore.userProfileImageUrl = noProfileImage
  }

  return { authStore, setLogin, setLogout, logout }
})
