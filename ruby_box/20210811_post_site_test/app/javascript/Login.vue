<template>
  <div class="login">
    log in
    <div>
      <div>{{ this.message }}</div>
      <input type="text" v-model="email" placeholder="NAME" /><br />
      <input type="password" v-model="password" placeholder="PASSWORD" /><br />
      <button v-on:click="login()">LOGIN</button>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
const qs = require("qs");

export default {
  name: "logIn",
  data: function () {
    return {
      email: "",
      password: "",
      message: "",
    };
  },
  methods: {
    async login() {
      const config = {
        headers: {
          "X-Requested-With": "XMLHttpRequest",
        },
        // リクエストに、sessionとcookieを含めるようにする
        withCredentials: true,
      }

      const self = this;
      const result = await axios
        .post("/api/v1/login", {
          account: {
            email: this.email,
            password: this.password,
          },
          paramsSerializer: function (params) {
            return qs.stringify(params, { arrayFormat: "brackets" });
          },
          config
        })
        .catch((e) => {
          console.error(e);
        });

      console.log(result)
      if (!result) {
        this.message = "エラー";
        return;
      }
      if (!result.data) {
        this.message = "エラー";
        return;
      }

      if (result.data.state) {
        //結果を基にページ遷移
        this.$router.push("/");
      }
    },
  },
};
</script>