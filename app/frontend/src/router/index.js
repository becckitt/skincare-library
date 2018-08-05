import Vue from 'vue'
import Router from 'vue-router'
import HomePage from '@/pages/HomePage'
import AppLogin from '@/pages/AppLogin'
import AppSignup from '@/pages/AppSignup'
import Dashboard from '@/pages/Dashboard'
import BrandProducts from '@/pages/BrandProducts'
import ProductView from '@/pages/ProductView'
import IngredientView from '@/pages/IngredientView'
import TagView from '@/pages/TagView'
import firebase from 'firebase'
import 'firebase/auth'

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
      path: '/brand/:brandName',
      name: 'brand',
      component: BrandProducts,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: '/ingredient/:ingredientName',
      name: 'ingredient',
      component: IngredientView,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: '/tag/:tagName',
      name: 'tag',
      component: TagView,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: '/products/:id',
      name: 'product',
      component: ProductView,
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

router.beforeEach((to, from, next) => {
  const currentUser = firebase.auth().currentUser
  const requiresAuth = to.matched.some(record => record.meta.requiresAuth)

  if (requiresAuth && !currentUser) {
    next('/login')
  } else if (requiresAuth && currentUser) {
    next()
  } else {
    next()
  }
})

export default router
