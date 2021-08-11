<template>
  <form @submit.prevent="createArticle">
    <div v-if="errors.length != 0">
      <ul v-for="e in errors" :key="e">
        <li><font color="red">{{ e }}</font></li>
      </ul>
    </div>
    <div>
      <label>Name</label>
      <input v-model="article.name" type="text">
    </div>
    <div>
      <label>Text</label>
      <input v-model="article.text" type="text">
    </div>
    <button type="submit">Commit</button>
  </form>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      article: {
        name: '',
        text: ''
      },
      errors: ''
    }
  },
  methods: {
    createArticle: function() {
      axios
        .post('/api/v1/articles', this.article)
        .then(response => {
          let a = response.data;
          this.$router.push({ name: 'article_details', params: { id: a.id } });
        })
        .catch(error => {
          console.error(error);
          if (error.response.data && error.response.data.errors) {
            this.errors = error.response.data.errors;
          }
        });
    }
  }
}
</script>

<style scoped>
</style>