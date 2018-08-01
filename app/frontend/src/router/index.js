import Vue from 'vue'
import Router from 'vue-router'
import HomePage from '@/pages/HomePage'
import AppLogin from '@/pages/AppLogin'
import AppSignup from '@/pages/AppSignup'
import Dashboard from '@/pages/Dashboard'
// import firebase from 'firebase'

Vue.use(Router)

let router = new Router({
  routes: [
    {
      path: '/',
      name: 'HomePage',
      component: HomePage
    },
    {
      path: '/signup',
      name: 'AppSignup',
      component: AppSignup
    },
    {
      path: '/login',
      name: 'AppLogin',
      component: AppLogin
    },
    {
      path: '/dashboard',
      name: 'dashboard',
      component: Dashboard,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: '*',
      redirect: HomePage
    }
  ]
})

// router.beforeEach((to, from, next) => {
//   let currentUser = firebase.auth().currentUser
//   let requiresAuth = to.matched.some(record => record.meta.requiresAuth)

//   if (requiresAuth && !currentUser) next('/login')
//   else if (!requiresAuth && currentUser) next('/login')
//   else next()
// })

export default router
