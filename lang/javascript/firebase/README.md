# firebase

## 実行
```
$ npm run dev
```

## Deploy
deployするときの手順メモ

```
$ npm run build
$ npm run generate
$ firebase deploy
```

## Authentication
firebase console内のログインの方法を指定する

#### googleログインの場合
```
<button @click="googleLogin">googleでログイン</button>

...

firebase.auth().signInWithRedirect(new firebase.auth.GoogleAuthProvider());
```
#### メールアドレスとパスワードの場合
```
メール<br>  
<input type="text" v-model="email" class="input"><br>  
パスワード<br>  
<input type="password" v-model="password" class="input"><br>  
<button v-on:click="login" class="button is-primary">ログイン</button>

...

login() {
  firebase.auth().signInWithEmailAndPassword(this.email, this.password)
  .then(user => {
  // ログインしたら飛ぶページを指定
  this.$router.push("/member-page")
  }).catch((error) => {
    alert(error)
  });
},
logout() {
  firebase.auth().signOut()
  .then(() => {
    this.setUser(null)
  }).catch((error) => {
    alert(error)
  })
},
```
