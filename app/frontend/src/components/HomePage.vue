<template>
  <div class="main-wrapper">
    {{ this.products }}
  </div>
</template>

<script>
export default {
  name: 'HomePage',
  data () {
    return {
      loading: false,
      products: []
    }
  },
  created () {
    this.fetchProducts()
  },
  methods: {
    async fetchProducts () {
      this.loading = true

      try {
        // this.products = (await Product.all()).data
      } catch (e) {
        console.log('Something went wrong fetching products: ', e)
      }

      this.loading = false
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
