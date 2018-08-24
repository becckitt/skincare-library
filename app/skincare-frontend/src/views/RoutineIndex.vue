<template>
  <div>
    <h1>All routines</h1>
    <div v-for="routine in routines" :key="routine.id">
      <h4>Routine {{ routine.id }}</h4>
      <p>{{ parseInt(routine.time_of_day) === 0 ? 'am' : 'pm'  }} routine</p>
      <router-link :to="{name: 'routine', params: { routineId: routine.id }}">View routine</router-link>
    </div>
  </div>
</template>

<script>
import { ALL_ROUTINES_QUERY } from '@/constants/graphql'

export default {
  name: 'Routines',
  data () {
    return {
      routines: []
    }
  },
  apollo: {
    routines: {
      query: ALL_ROUTINES_QUERY,
      update (data) {
        return data.routineSearch
      }
    }
  }
}
</script>
