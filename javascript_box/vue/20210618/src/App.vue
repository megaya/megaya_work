<template>
  <div id="app">
    <div>{{ doneTodoCount }}</div>
  </div>
</template>

<script>
import { mapState } from 'vuex'

export default {
  name: 'App',
  computed: {
    ...mapState([
      "todos"
    ]),
    doneTodoCount () {
      return this.$store.getters.doneTodoCount
    }
  }
}
</script>

