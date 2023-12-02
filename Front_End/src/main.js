import 'bootstrap'
import * as bootstrap from 'bootstrap'

import { createApp } from 'vue'
import App from './App.vue'

import router from './router'
import { createPinia } from 'pinia'

import axios from 'axios'

window.bootstrap = bootstrap

const app = createApp(App)

app.use(router)
app.use(createPinia())

app.mount('#app')
