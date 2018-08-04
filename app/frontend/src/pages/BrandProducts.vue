<template>
  <div>
    <h1>Products from {{ brandName }}</h1>
    <div :for="product in products" :key="product">
      <h4>{{product.name}}</h4>
      <p>{{product.comment}}</p>
      <router-link :to="{name: 'product', params: { id: product.id }}">View product</router-link>
    </div>
  </div>
</template>

<script>
import { BRAND_SEARCH_QUERY } from '@/constants/graphql'

export default {
  name: 'BrandProducts',
  data () {
    return {
      brandProducts: [],
      queryParam: this.$route.params.brandName
    }
  },
  apollo: {
    brandProducts: {
      query: BRAND_SEARCH_QUERY,
      variables () {
        return {
          filter: this.queryParam
        }
      },
      update (data) {
        return data.brandSearch[0]
      }
    }
  },
  computed: {
    brandName () {
      return this.brandProducts.name
    },
    products () {
      return this.brandProducts.products
    }
  }
}
</script>
