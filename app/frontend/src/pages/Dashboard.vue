<template>
  <div class="main-wrapper">
    <!-- {{ this.products }} -->
    <h1> hello!!! </h1>
  </div>
</template>

<script>
// import { ALL_PRODUCTS_QUERY } from '@/constants/graphql'

export default {
  name: 'Dashboard',
  data () {
    return {
      loading: false,
      products: []
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1, h2 {
  font-weight: normal;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
