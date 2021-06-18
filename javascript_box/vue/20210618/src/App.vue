<template>
  <div id="app">
    {{ count1 }}
    {{ count2 }}
  </div>
</template>

<script>
import { mapState } from 'vuex'

export default {
  name: 'App',
  computed: {
    ...mapState([
      "count1",
      "count2"
    ])
  }
}
</script>

