<template>
  <div class="nav-wrapper">
    <div v-if="!currentUser" class="nav-inner-wrapper">
      <router-link to="/">Skincare Tracker</router-link>
      <router-link to="/login">Login</router-link>
      <router-link to="/signup">Signup</router-link>
    </div>
    <div v-else class="nav-inner-wrapper">
      <router-link to="/dashboard">Skincare Tracker</router-link>
      <button @click="logout">Logout</button>
    </div>
  </div>
</template>

<script>
import firebase from 'firebase/app'
import 'firebase/auth'

export default {
  name: 'AppNavigation',
  computed: {
    currentUser () {
      return firebase.auth().currentUser
    }
  },
  methods: {
    logout: function () {
      firebase.auth().signOut().then(() => {
        this.$router.replace('/')
      })
    }
  }
}
</script>
