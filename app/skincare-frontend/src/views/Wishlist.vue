<template>
  <div>
    <h1>Products in Wishlist</h1>
    <div v-for="product in wishlistProducts" :key="product.id">
      <h4>{{product.name}}</h4>
      <p>{{product.comment}}</p>
      <router-link :to="{name: 'product', params: { id: product.id }}">View product</router-link>
    </div>
  </div>
</template>

<script>
import { WISHLIST_QUERY } from '@/constants/graphql_queries'

export default {
  name: 'Wishlist',
  data () {
    return {
      wishlistProducts: []
    }
  },
  apollo: {
    wishlistProducts: {
      query: WISHLIST_QUERY,
      update (data) {
        return data.wishlistSearch
      }
    }
  }
}
</script>
