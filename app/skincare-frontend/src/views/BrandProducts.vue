<template>
  <div>
    <h1>Products from {{ brandName }}</h1>
    <div v-for="product in products" :key="product.id">
      <h4>{{product.name}}</h4>
      <p>{{product.comment}}</p>
      <router-link :to="{name: 'product', params: { id: product.id }}">View product</router-link>
    </div>
  </div>
</template>

<script>
import { BrandSearch } from '../graphql/queries/brands.graphql'

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
      query: BrandSearch,
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
