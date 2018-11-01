<template>
  <div class="main-wrapper">
    <h1> {{ product.name }} </h1>
    <div class="details-section">
      <div class="detail">
        <p class="detail-label">Brand</p>
        <router-link :to="{ name: 'brand', params: { brandName: product.brand.name }}">{{ product.brand.name }}</router-link>
      </div>
      <div class="detail">
        <p class="detail-label">Type</p>
        <p> {{ product.product_type }} </p>
      </div>
      <div class="detail">
        <p class="detail-label">Price</p>
        <p> ${{ product.price_cents }} </p>
      </div>
      <div class="detail">
        <p class="detail-label">Rating</p>
        <p> {{ product.rating }} </p>
      </div>
      <div class="detail">
        <p class="detail-label">Re-buy?</p>
        <p> {{ product.repurchase }} </p>
      </div>
      <div class="detail long-section">
        <p class="detail-label">Notes</p>
        <p> {{ product.comment }} </p>
      </div>
      <div class="detail">
        <p class="detail-label">Ingredients</p>
        <p v-for="(ingredient, index) in ingredients" :key="ingredient" class="link-list--item">
          <router-link :to="{ name: 'ingredient', params: { ingredientName: ingredient }}">{{ ingredient }}</router-link>
          <span v-if="index+1 < ingredients.length">,</span>
        </p>
      </div>
      <div class="detail">
        <p class="detail-label">Tags</p>
        <p v-for="(tag, index) in tags" :key="tag"  class="link-list--item">
          <router-link :to="{ name: 'tag', params: { tagName: tag }}">{{ tag }}</router-link>
          <span v-if="index+1 < tags.length">, </span>
        </p>
      </div>
    </div>

    <router-link :to="{name: 'editProduct', params: { id: product.id }}" class="product-button">Edit product</router-link>
  </div>
</template>
<script>
import { ProductSearch } from '../graphql/queries/products.graphql'
import { pluck } from 'underscore'

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
      query: ProductSearch,
      variables () {
        return {
          id: this.queryParam
        }
      },
      update (data) {
        return data.allProducts[0]
      }
    }
  },
  computed: {
    ingredients () {
      return pluck(this.product.ingredients, 'name')
    },
    tags () {
      return pluck(this.product.tags, 'name')
    }
  }
}
</script>

<style scoped>
.details-section {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  text-align: left;
}

.detail.long-section {
  grid-column: 1/2;
}

.detail-label {
  font-weight: bold;
}

.link-list--item {
  display: inline;
}
</style>
