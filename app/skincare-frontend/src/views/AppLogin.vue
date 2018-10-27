<template>
  <div>
    <h4> Log in </h4>
    <form @submit.prevent="login">
      <input type="email" v-model="email" placeholder="Email">
      <input type="password" v-model="password" placeholder="Password">
      <button>Log in</button>
    </form>
    <p>Don't have an account? <router-link to="/signup">Create one.</router-link></p>
  </div>
</template>

<script>
import firebase from 'firebase/app'
import 'firebase/auth'
import 'firebaseui'

export default {
  name: 'AppLogin',
  data () {
    return {
      email: '',
      password: ''
    }
  },
  methods: {
    login: function () {
      firebase.auth().signInWithEmailAndPassword(this.email, this.password).then(() => {
        this.$router.push('dashboard')
      }).catch((error) => {
        console.log('firebase login failed: ' + error)
      })
    }
  }
}
</script>
