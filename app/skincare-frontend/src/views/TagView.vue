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
import { TagSearch } from '../graphql/queries/tags.graphql'

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
      query: TagSearch,
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
