<template>
  <div>
    <h1>Products in routine {{ routineData.id }}</h1>
    <i>{{ timeOfDay }} routine</i>
    <div v-for="product in products" :key="product.id">
      <h4>{{product.name}}</h4>
      <p>{{product.comment}}</p>
      <router-link :to="{name: 'product', params: { id: product.id }}">View product</router-link>
    </div>
  </div>
</template>

<script>
import { RoutineSearch } from '../graphql/queries/routines.graphql'

export default {
  name: 'Routine',
  data () {
    return {
      routineData: [],
      queryParam: this.$route.params.routineId
    }
  },
  apollo: {
    routineData: {
      query: RoutineSearch,
      variables () {
        return {
          filter: this.queryParam
        }
      },
      update (data) {
        return data.routineSearch[0]
      }
    }
  },
  computed: {
    products () {
      return this.routineData.products
    },
    timeOfDay () {
      return parseInt(this.routineData.time_of_day) === 0 ? 'am' : 'pm'
    }
  }
}
</script>
