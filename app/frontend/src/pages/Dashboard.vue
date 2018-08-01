<template>
  <div class="main-wrapper">
    <h1> Skincare Tracker </h1>
    {{ this.products }}
  </div>
</template>

<script>
import { ALL_PRODUCTS_QUERY } from '@/constants/graphql'

export default {
  name: 'Dashboard',
  data () {
    return {
      loading: false,
      products: []
    }
  },
  apollo: {
    products: {
      query: ALL_PRODUCTS_QUERY,
      update (data) {
        return data.allProducts
      }
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
