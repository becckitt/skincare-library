<template>
  <div class="main-wrapper large">
    <div class="table-header">
      <h1>Products in your shelf</h1>
      <router-link :to="{name: 'newProduct'}">Add a product --></router-link>
    </div>
    <products-table :products="products"/>
  </div>
</template>

<script>
import ProductsTable from '@/components/ProductsTable'
import { AllProducts } from '../graphql/queries/products.graphql'

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
      query: AllProducts,
      update (data) {
        return data.allProducts
      }
    }
  }
}
</script>

<style scoped lang="scss">
.table-header {
  display: flex;
  justify-content: space-between;
  align-items: center;

  h1 {
    display: inline;
  }
}

h1 {
  text-align: left;
}

a {
  background: transparent;
  border: 2px solid black;
  border-radius: 0;
  color: black;
  font-family: 'Roboto Mono', monospace;
  font-weight: bold;
  font-size: 13px;
  max-height: 45px;
  min-width: 140px;
  padding: 8px;
  text-decoration: none;

  &:hover {
    background: #e2e1e1;
  }
}
</style>
