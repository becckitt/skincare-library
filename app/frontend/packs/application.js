/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import axios from 'axios'
import Vue from 'vue'
import firebase from 'firebase/app'
import 'firebase/auth'
import 'firebaseui'

Vue.http = Vue.prototype.$http = axios

const config = {
  apiKey: "AIzaSyByet0rN7obtN6XkgHyU1n_MDMQm_ii668",
  authDomain: "skincare-library-c0019.firebaseapp.com",
  databaseURL: "https://skincare-library-c0019.firebaseio.com",
  projectId: "skincare-library-c0019",
  storageBucket: "skincare-library-c0019.appspot.com",
  messagingSenderId: "687793472453"
}

firebase.initializeApp(config)
