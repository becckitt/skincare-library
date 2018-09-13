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
        
        // send token to endpoint in app
        // need to do something to let graphql know,
        // but maybe that happens backend?
        // or does it happen in apollo

        this.$http.post('localhost:3000/authenticate', credentials).then((response) => {
          window.localStorage.setItem('AUTH_TOKEN', response.data.token)
          // window.localStorage.setItem('auth-user', JSON.stringify(response.data.user))
        }).catch((errors) => {
          console.log('login failed: ' + errors)
        })
      }).catch((errors) => {
        console.log('firebase login failed: ' + errors)
      })
    }
  }
}
</script>
