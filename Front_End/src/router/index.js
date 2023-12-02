import { createRouter, createWebHistory } from 'vue-router'
import AboutPage from '@/components/About.vue'
import ServicePage from '@/components/Service.vue'
import PortfolioPage from '@/components/Portfolio.vue'
import CallToActionPage from '@/components/CallToAction.vue'
import ContactPage from '@/components/Contact.vue'

import LoginView from '@/views/LoginView.vue'
import JoinView from '@/views/JoinView.vue'
import MainView from '@/views/MainView.vue'
import SocialView from '@/views/SocialView.vue'
import ProfileView from '@/views/ProfileView.vue'
import MakePlanView from '@/views/MakePlanView.vue'
import PostView from '@/views/PostView.vue'

import PlaceView from '@/views/PlaceView.vue'
/*
<masthead></masthead>
<app-list-view></app-list-view>
<about></about>
<service></service>
<portfolio></portfolio>
<call-to-action></call-to-action>
<contact></contact>
*/

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'Main',
      component: MainView
    },
    {
      path: '/login',
      name: 'Login',
      component: LoginView
    },
    {
      path: '/join',
      name: 'Join',
      component: JoinView
    },
    {
      path: '/social',
      component: SocialView,
      name: 'SocialView'
    },
    {
      path: '/profile',
      name: 'Profile',
      component: ProfileView
    },
    {
      path: '/place',
      component: PlaceView,
      name: 'Place'
    },
    {
      path: '/makeplan',
      component: MakePlanView,
      name: 'MakePlan'
    },
    {
      path: '/post',
      component: PostView,
      name: 'Post'
    }
  ]
})

export default router
