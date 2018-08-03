<template>
  <div class="main-wrapper">
    <h1> {{ product.name }} </h1>
    <p> {{ product.comment }} </p>
    <router-link :to="{ name: 'brand', params: { brandName: product.brand.name }}">{{ product.brand.name }}</router-link>
  </div>
</template>


<script>
import { PRODUCT_SEARCH_QUERY } from '@/constants/graphql'

export default {
  name: 'ProductView',
  data () {
    return {
      product: [],
      queryParam: this.$route.params.id
    }
  },
  apollo: {
    product: {
      query: PRODUCT_SEARCH_QUERY,
      variables () {
        return {
          id: this.queryParam
        }
      },
      update (data) {
        return data.allProducts[0]
      }
    }
  }
}
</script>

<style scoped>

</style>