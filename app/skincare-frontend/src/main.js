// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import firebase from 'firebase'
import { createProvider } from './vue-apollo'
import './assets/stylesheets/main.css'
import axios from 'axios'
let userToken

let app
Vue.http = Vue.prototype.$http = axios.create({
  baseURL: 'http://localhost:3000',
  headers: {
    'Access-Control-Allow-Origin': '*',
    'Content-Type': 'application/json',
    'Authorization': userToken || ''
  }
})

const config = {
  apiKey: 'AIzaSyByet0rN7obtN6XkgHyU1n_MDMQm_ii668',
  authDomain: 'skincare-library-c0019.firebaseapp.com',
  databaseURL: 'https://skincare-library-c0019.firebaseio.com',
  projectId: 'skincare-library-c0019',
  storageBucket: 'skincare-library-c0019.appspot.com',
  messagingSenderId: '687793472453'
}

firebase.initializeApp(config)

Vue.config.productionTip = false

/* eslint-disable no-new */
firebase.auth().onAuthStateChanged(function (user) {
  if (!app) {
    new Vue({
      el: '#app',
      router,
      provide: createProvider().provide(),
      apolloProvider: createProvider(),
      render: h => h(App)
    }).$mount('#app')
  }

  if (user) {
    user.getIdToken(/* forceRefresh */ true).then(function (idToken) {
      const header = { Authorization: `${idToken}` }
      userToken = idToken

      Vue.http.post('/authenticate', { headers: header }).then((response) => {
        // window.localStorage.setItem('AUTH_TOKEN', response.data.token)
        // this.$router.push('dashboard')
        window.localStorage.setItem('firebaseJwt', idToken)
      }).catch((error) => {
        console.log('post failed in main: ' + error)
      })
    })
  }
})
