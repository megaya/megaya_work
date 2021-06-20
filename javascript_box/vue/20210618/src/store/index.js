import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    todos: [
      { id: 1, label: 'a', done: true },
      { id: 2, label: 'a', done: false }
    ]
  },
  getters: {
    doneTodoCount: (state) => {
      return state.todos.filter(todo => todo.done).length
    }
  },
  mutations: {
  },
  actions: {
  },
  modules: {
  }
})
