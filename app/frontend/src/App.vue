<template>
  <div id="app">
    <app-navigation/>
    <router-view/>
  </div>
</template>

<script>
import AppNavigation from './components/AppNavigation'
export default {
  name: 'App',
  components: {
    AppNavigation
  }
}
</script>

<style>
#app {
  /* font-family: 'Avenir', Helvetica, Arial, sans-serif; */
  font-family: 'Roboto Mono', monospace;
  font-size: 14px;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
}
</style>
