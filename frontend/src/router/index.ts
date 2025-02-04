import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'

const routes = [
    {
        path: '/',
        name: 'home',
        component: HomeView,
        meta: { title: 'Bandwidth' }
    },
    {
        path: '/about',
        name: 'about',
        component: () => import('../views/AboutView.vue'),
        meta: { title: 'Bandwidth | About' }
    },
    {
        path: '/event',
        name: 'event',
        component: () => import('../views/EventSearchView.vue'),
        meta: { title: 'Bandwidth | Events' }
    },
    {
        path: '/event/:id',
        name: 'event-focus',
        component: () => import('../views/EventFocusView.vue')
    },
    {
        path: '/venue',
        name: 'venue',
        component: () => import('../views/VenueSearchView.vue'),
        meta: { title: 'Bandwidth | Venues' }
    },
    {
        path: '/venue/:id',
        name: 'venue-focus',
        component: () => import('../views/VenueFocusView.vue')
    },
    {
        path: '/artist',
        name: 'artist',
        component: () => import('../views/ArtistSearchView.vue'),
        meta: { title: 'Bandwidth | Artists' }
    },
    {
        path: '/artist/:id',
        name: 'artist-focus',
        component: () => import('../views/ArtistFocusView.vue')
    },
    {
        path: '/user',
        name: 'user',
        component: () => import('../views/UserView.vue'),
        meta: { title: 'Bandwidth | Profile' }
    },
    {
        path: '/login',
        name: 'login',
        component: () => import('../views/LoginView.vue'),
        meta: { title: 'Bandwidth | Login' }
    },
    {
        path: '/:catchAll(.*)',
        redirect: { name: 'home' }
    }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
