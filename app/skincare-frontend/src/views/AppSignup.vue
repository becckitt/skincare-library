<template>
  <div>
    <h4> Sign up </h4>
    <form @submit.prevent="signup">
      <input type="email" v-model="email" placeholder="Email">
      <input type="password" v-model="password" placeholder="Password">
      <button>Sign up</button>
    </form>
    <p>Already have an account? <router-link to="/login">Login here.</router-link></p>
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
    signup: function () {
      firebase.auth().createUserWithEmailAndPassword(this.email, this.password).then(() => {
        // do the create user mutation
        this.$router.replace('dashboard')
      })
    }
  }
}
</script>
