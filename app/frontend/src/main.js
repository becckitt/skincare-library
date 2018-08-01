// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import axios from './backend/vue-axios'
import { ApolloClient } from 'apollo-client'
import { HttpLink } from 'apollo-link-http'
import { InMemoryCache } from 'apollo-cache-inmemory'
import { setContext } from 'apollo-link-context'
import VueApollo from 'vue-apollo'
import firebase from 'firebase'
import './assets/main.css'
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

const httpLink = new HttpLink({
  uri: 'http://localhost:3000/graphql'
})

const middlewareLink = setContext(() => ({
  headers: {
    authorization: `*`
  }
}))

const link = middlewareLink.concat(httpLink)

const apolloClient = new ApolloClient({
  link: link,
  cache: new InMemoryCache(),
  connectToDevTools: true
})

Vue.use(VueApollo)

const apolloProvider = new VueApollo({
  defaultClient: apolloClient
})

/* eslint-disable no-new */
firebase.auth().onAuthStateChanged(function (user) {
  if (!app) {
    new Vue({
      el: '#app',
      router,
      axios,
      provide: apolloProvider.provide(),
      components: { App },
      template: '<App/>'
    })
  }
})
