<template>
  <div>
    <h1>Products tagged as '{{ tagName }}'</h1>
    <div v-for="product in products" :key="product">
      <h4>{{product.name}}</h4>
      <p>{{product.comment}}</p>
      <router-link :to="{name: 'product', params: { id: product.id }}">View product</router-link>
    </div>
  </div>
</template>

<script>
import { TAG_SEARCH_QUERY } from '@/constants/graphql_queries'

export default {
  name: 'TagView',
  data () {
    return {
      tagProducts: [],
      queryParam: this.$route.params.tagName
    }
  },
  apollo: {
    tagProducts: {
      query: TAG_SEARCH_QUERY,
      variables () {
        return {
          filter: this.queryParam
        }
      },
      update (data) {
        return data.tagSearch[0]
      }
    }
  },
  computed: {
    tagName () {
      return this.tagProducts.name
    },
    products () {
      return this.tagProducts.products
    }
  }
}
</script>
