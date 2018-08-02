<template>
  <div>
    {{ brandProducts }}
  </div>
</template>

<script>
import { BRAND_PRODUCTS_QUERY } from '@/constants/graphql'
export default {
  name: 'BrandProducts',
  data () {
    return {
      brandProducts: []
    }
  },
  apollo: {
    brandProducts: {
      query: BRAND_PRODUCTS_QUERY,
      update (data) {
        return data
      }
    }
  }
}
</script>
