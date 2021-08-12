<template>
  <div id="app">
    <table>
      <tbody>
        <tr>
          <th>ID</th>
          <th>name</th>
          <th>text</th>
        </tr>
        <tr v-for="a in articles" :key="a.id">
          <td><router-link :to="{ name: 'article_details', params: { id: a.id } }">{{ a.id }}</router-link></td>
          <td>{{ a.name }}</td>
          <td>{{ a.text }}</td>
        </tr>
      </tbody>
    </table>
    <div><router-link :to="{ name: 'article_new' }">新しく作成する</router-link></div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      articles: []
    }
  },
  async mounted () {
    await this.getAccountData();

    await axios
      .get('/api/v1/articles.json')
      .then(response => (this.articles = response.data))
  },
  methods: {
    async getAccountData() {

      const result = await axios.get("/api/v1/account").catch((e) => {
        console.error(e);
      });

      if (!result) {
        // エラーの場合ログイン画面へ遷移させる
        this.redirectLogin();
        return;
      }
      if (!result.data.email) {
        // エラーの場合ログイン画面へ遷移させる
        this.redirectLogin();
        return;
      }

      this.email = result.data.email;
    },
    redirectLogin() {
      //ページ遷移
      this.$router.push("/login");
    },
  },
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>