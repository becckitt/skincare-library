<template>
  <div class="products-table">
    <h3>Products</h3>
    <vue-good-table
      :columns="columns"
      :rows="products"
      theme="default" />
  </div>
</template>

<script>
import { VueGoodTable } from 'vue-good-table'

export default {
  name: 'ProductsTable',
  components: {
    VueGoodTable
  },
  data () {
    return {
      columns: [
        {label: 'Name', field: 'name'},
        {label: 'Brand', field: 'brand.name'},
        {label: 'Comment', field: 'comment'}
      ]
    }
  },
  props: {
    products: {
      type: Array,
      required: true
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.products-table {
  text-align: left;
}

th, td {
  margin-right: 10px;
}
</style>
