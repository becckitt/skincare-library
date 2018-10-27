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
import { AllRoutines } from '../graphql/queries/routines.graphql'

export default {
  name: 'Routines',
  data () {
    return {
      routines: []
    }
  },
  apollo: {
    routines: {
      query: AllRoutines,
      update (data) {
        return data.AllRoutines
      }
    }
  }
}
</script>
