<template>
  <div class="nav-wrapper">
    <div v-if="!currentUser" class="nav-wrapper-inner">
      <router-link to="/">Skincare Tracker</router-link>
      <router-link to="/login">Login</router-link>
      <router-link to="/signup">Signup</router-link>
    </div>
    <div v-else class="nav-wrapper-inner">
      <router-link to="/dashboard">Skincare Tracker</router-link>
      <router-link to="/routines">Routines</router-link>
      <router-link to="/wishlist">Wishlist</router-link>
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

<style scoped lang="scss">
.nav-wrapper {
  height: 40px;
  margin-bottom: 20px;
  -webkit-box-shadow: 0 5px 8px -5px #aaa;
  -moz-box-shadow: 0 5px 8px -5px #aaa;
  box-shadow: 0 5px 8px -5px #aaa;
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  font-size: 1.05rem;
}

.nav-wrapper-inner {
  height: 100%;
  padding: 0 15px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

a {
  color: #000;
  text-decoration: none;
  font-weight: bold;
}

button {
  border: none;
  font-size: 12px;
  cursor: pointer;
}
</style>
