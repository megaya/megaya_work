<template>
  <div>詳細表示</div>
  <div>{{ article.id }} </div>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      article: {}
    }
  },
  mounted () {
    axios
      .get(`/api/v1/articles/${this.$route.params.id}.json`)
      .then(response => (this.article = response.data))
  }
}
</script>

<style scoped>
</style>