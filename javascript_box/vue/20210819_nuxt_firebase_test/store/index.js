import firebase from '~/plugins/firebase'

export const state = () => ({
  isLogin: false
})

export const mutations = {
  SET_IS_LOGIN(state, bool) {
    state.isLogin = bool
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
}

export const getters = {
}