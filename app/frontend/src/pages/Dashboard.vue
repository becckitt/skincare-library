<template>
  <div class="dashboard-wrapper">
    <products-table :products="products"/>
  </div>
</template>

<script>
import ProductsTable from '@/components/ProductsTable'
import { ALL_PRODUCTS_QUERY } from '@/constants/graphql'

export default {
  name: 'Dashboard',
  data () {
    return {
      loading: false,
      products: []
    }
  },
  components: {
    ProductsTable
  },
  apollo: {
    products: {
      query: ALL_PRODUCTS_QUERY,
      update (data) {
        return data.allProducts
      }
    }
  }
}
</script>

<style scoped>
.dashboard-wrapper {
  max-width: 950px;
  margin: 0 auto;
  padding: 0 15px;
}
</style>
