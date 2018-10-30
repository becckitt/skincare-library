<template>
  <div class="main-wrapper large">
    <h1>Products in Wishlist</h1>
    <div class="products-table">
      <v-client-table
        :data="wishlistProducts"
        :columns="columns">
        <a slot="link" slot-scope="props" v-bind:href="props.row.link">Link</a>
      </v-client-table>
    </div>
  </div>
</template>

<script>
import { WishlistSearch } from '../graphql/queries/wishlist.graphql'

export default {
  name: 'Wishlist',
  data () {
    return {
      wishlistProducts: [],
      columns: ['name', 'comment', 'link']
    }
  },
  apollo: {
    wishlistProducts: {
      query: WishlistSearch,
      update (data) {
        return data.wishlistSearch
      }
    }
  }
}
</script>
