<template>
  <div>
    <h1>Products with {{ ingredientName }}</h1>
    <div v-for="product in products" :key="product.id">
      <h4>{{product.name}}</h4>
      <p>{{product.comment}}</p>
      <router-link :to="{name: 'product', params: { id: product.id }}">View product</router-link>
    </div>
  </div>
</template>

<script>
import { IngredientSearch } from '../graphql/queries/ingredients.graphql'

export default {
  name: 'IngredientView',
  data () {
    return {
      ingredientProducts: [],
      queryParam: this.$route.params.ingredientName
    }
  },
  apollo: {
    ingredientProducts: {
      query: IngredientSearch,
      variables () {
        return {
          filter: this.queryParam
        }
      },
      update (data) {
        return data.IngredientSearch[0]
      }
    }
  },
  computed: {
    ingredientName () {
      return this.ingredientProducts.name
    },
    products () {
      return this.ingredientProducts.products
    }
  }
}
</script>
