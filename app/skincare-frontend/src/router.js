import Vue from 'vue'
import Router from 'vue-router'
import HomePage from '@/views/HomePage'
import AppLogin from '@/views/AppLogin'
import AppSignup from '@/views/AppSignup'
import Dashboard from '@/views/Dashboard'
import BrandProducts from '@/views/BrandProducts'
import ProductView from '@/views/ProductView'
import IngredientView from '@/views/IngredientView'
import TagView from '@/views/TagView'
import RoutineView from '@/views/RoutineView'
import RoutineIndex from '@/views/RoutineIndex'
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
      path: '/brands/:brandName',
      name: 'brand',
      component: BrandProducts,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: '/ingredients/:ingredientName',
      name: 'ingredient',
      component: IngredientView,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: '/tags/:tagName',
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
      path: '/routines/:routineId',
      name: 'routine',
      component: RoutineView,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: '/routines',
      name: 'routines',
      component: RoutineIndex,
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
