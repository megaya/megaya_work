import firebase from '~/plugins/firebase'

const db = firebase.firestore();
const todoRef = db.collection('todos')


export const state = () => ({
  isLogin: false,
  todos: []
})

export const mutations = {
  SET_IS_LOGIN(state, bool) {
    state.isLogin = bool
  },
  addTodo(state, todo) {
    state.todos.push(todo)
  }
}

export const actions = {
  login() {
    const provider = new firebase.auth.GoogleAuthProvider();
    firebase.auth().signInWithPopup(provider).then(function(result) {
      console.log(result)
    }).catch(function(error) {
      var errorCode = error.code;
      console.log('error : ' + errorCode)
    });
  },
  isLogin(context) {
    firebase.auth().onAuthStateChanged((user) => {
      if (user) {
        console.log('-- Login User --')
        context.commit('SET_IS_LOGIN', true)
      } else {
        console.log('!!No User!!')
        context.commit('SET_IS_LOGIN', false)
      }
    })
  },
  logout(context) {
    localStorage.clear()
    firebase
      .auth()
      .signOut()
      .then(() => {
        // Sign-out successful.
        context.commit('SET_IS_LOGIN', false)
      })
      .catch((error) => {
        // An error happened.
        console.log(error)
      })
  },
  fetchTodos({ commit }) {
    todoRef
    .get()
    .then(res => {
      res.forEach((doc) => {
        console.log('success : ' + `${doc.id} => ${doc.data()}`);
        commit('addTodo', doc.data())
      })
    })
    .catch(error => {
      console.log('error : ' + error)
    })
  }
}

export const getters = {
  getTodos(state) {
    return state.todos
  }
}