<template>
  <div class="products-table">
    <h3>Products</h3>
    <vue-good-table
      :columns="columns"
      :rows="products">

      <template slot="table-row" slot-scope="props">
        <td v-if="props.column.field == 'name'"> {{ props.row.name }}</td>
        <td v-if="props.column.field == 'brand'"> <router-link :to="{ name: 'brand', params: { brandName: props.row.brand.name }}">{{ props.row.brand.name }}</router-link></td>
        <td v-if="props.column.field == 'comment'"> {{ props.row.comment }}</td>
      </template>
    </vue-good-table>
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
        {label: 'Brand', field: 'brand'},
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
