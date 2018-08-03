<template>
  <div class="main-wrapper">
    <h1> {{ product.name }} </h1>
    <p class="detail-label">Brand</p>
    <router-link :to="{ name: 'brand', params: { brandName: product.brand.name }}">{{ product.brand.name }}</router-link>
    <p class="detail-label">Type</p>
    <p> {{ product.product_type }} </p>
    <p class="detail-label">Price</p>
    <p> ${{ product.price_cents }} </p>
    <p class="detail-label">Rating</p>
    <p> {{ product.rating }} </p>
    <p class="detail-label">Re-buy?</p>
    <p> {{ product.repurchase }} </p>
    <p class="detail-label">Notes</p>
    <p> {{ product.comment }} </p>
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
.detail-label {
  font-weight: bold;
}
</style>