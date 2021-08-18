import firebase from 'firebase'

if (!firebase.apps.length) {
  firebase.initializeApp(
    {
        apiKey: "AIzaSyD1KtmYJm_vHOHhr-B5e1mIMy7zahYAqIk",
        authDomain: "nuxt-test-91c64.firebaseapp.com",
        projectId: "nuxt-test-91c64",
        storageBucket: "nuxt-test-91c64.appspot.com",
        messagingSenderId: "243463976413",
        appId: "1:243463976413:web:0b5d556ae29ba66235f234"
    }
  )
}

export default firebase
