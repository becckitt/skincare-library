<template>
  <div class="products-table">
    <v-client-table
      :data="products"
      :columns="columns">
      <div slot="brand" slot-scope="props"><router-link :to="{ name: 'brand', params: { brandName: props.row.brand.name }}">{{ props.row.brand.name }}</router-link></div>
      <div slot="price_cents" slot-scope="props">${{ props.row.price_cents }}</div>
      <div slot="actions" slot-scope="props"><router-link :to="{name: 'product', params: { id: props.row.id }}">View</router-link></div>
    </v-client-table>
  </div>
</template>

<script>
export default {
  name: 'ProductsTable',
  data () {
    return {
      columns: ['brand', 'name', 'product_type', 'comment', 'rating', 'actions']
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
