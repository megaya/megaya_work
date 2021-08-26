<template>
  <div class="container">
    <div>
      <button class="button is-primary is-rounded" @click="login">
        ログイン
      </button>
    </div>

    <div>
      <button class="button is-primary is-rounded" @click="checkLogin">
        ログイン確認
      </button>
    </div>

    <div>
      <button class="button is-primary is-rounded" @click="logout">
        ログアウト
      </button>
    </div>

    <table class="table is-narrow">
      <thead>
        <tr>
          <th>todo</th>
          <th>limit</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="todo in $store.getters.getTodos" :key="todo.id">
          <td>{{todo.name}}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
export default {
  created() {
    this.$store.dispatch('fetchTodos')
  },

  methods: {
    login() {
      console.log('login')
      this.$store.dispatch('login')
    },
    async checkLogin() {
      await this.$store.dispatch('isLogin')
      console.log(this.$store.state)
    },
    logout() {
      this.$store.dispatch('logout')
      console.log(this.$store.state)
    },
  }
}
</script>

<style>
.container {
  margin: 0 auto;
  min-height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
}
</style>