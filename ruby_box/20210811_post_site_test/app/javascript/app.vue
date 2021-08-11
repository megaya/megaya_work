<template>
  <div>
    <router-view></router-view>
  </div>
</template>

<script>
import Vue from 'vue'
import VueRouter from 'vue-router'

import ArticleIndex from 'ArticleIndex.vue'
import ArticleDetail from 'ArticleDetail.vue'
import ArticleNew from 'ArticleNew.vue'

const router = new VueRouter({
  routes: [
    {
      path: '/',
      component: ArticleIndex
    },
    {
      path: '/articles/:id(\\d+)',
      component: ArticleDetail,
      name: 'article_details'
    },
    {
      path: '/articles/new',
      name: 'article_new',
      component: ArticleNew
    }
  ]
})

// ref. https://jp.vuejs.org/v2/guide/plugins.html#%E3%83%97%E3%83%A9%E3%82%B0%E3%82%A4%E3%83%B3%E3%81%AE%E4%BD%BF%E7%94%A8
Vue.use(VueRouter)

export default {
  router
}
</script>

<style scoped>
</style>