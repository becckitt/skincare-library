// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import firebase from 'firebase'
import { createProvider } from './vue-apollo'
import './assets/stylesheets/main.css'
let app

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
      render: h => h(App)
    }).$mount('#app')
  }
})
