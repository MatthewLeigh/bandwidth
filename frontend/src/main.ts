import { createApp, ref } from 'vue'
import App from './App.vue'
import { createPinia } from 'pinia'
import vuetify from './plugins/vuetify'
import router from './router'
import { loadFonts } from './plugins/webfontloader'
import './assets/styles/main.css'

loadFonts()

const pinia = createPinia();
const app = createApp(App);

// Globally listens to window width. $isMobile.value is true if on a mobile sized device.
const isMobile = ref(window.innerWidth < 722);
const updateIsMobile = () => { isMobile.value = window.innerWidth < 722; };
window.addEventListener("resize", updateIsMobile);
app.config.globalProperties.$isMobile = isMobile;

// Globally listens to window width. $isTablet.value is true if on a tablet sized device.
const isTablet = ref(window.innerWidth <= 1200);
const updateIsTablet = () => { isTablet.value = window.innerWidth <= 1200; };
window.addEventListener("resize", updateIsTablet);
app.config.globalProperties.$isTablet = isTablet;

app .use(pinia)
    .use(vuetify)
    .use(router)
    .mount('#app')
