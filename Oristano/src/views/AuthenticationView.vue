<script>
  import { useSessionStore } from '@/stores/session';
  import * as Auth from '@/utils/auth.js';
  export default {
    data() {
      return {
        username: 'Motresku',
        password: '65808'
      }
    },
    methods: {
      async login() {
        console.log('Sono dentro login()')
        const data = await Auth.login(this.username, this.password);
        if(data.message) console.log(data.message);
        if (data.userID) {
          useSessionStore().setUser(data.userID)
          this.$router.push('/');
        } else {
          alert('Login Error');
        }
      }
    }
  }
</script>

<template>
  <section class="login_container">
      <form action="login" method="POST" id="login">
        <router-link to="/">
        <img src="../assets/img/Logo.png" alt="Logo Cineva" height="150">
      </router-link>
        <h1 id="login_title">Login</h1>
        <label for="username">Username</label>
        <input type="text" name="username" v-model="username">
        <br>
        <label for="password">Password</label>
        <input type="password" name="password" v-model="password">
        <br>
        <input type="submit" value="Login" @click.stop.prevent="login()">
      </form>
  </section>
</template>

<style>
  .login_container {
    width: 100%;
  }
  #login {
    text-align: center;
    position: fixed;
    background-color: #9e191f;
    padding: 20px 30px;
    color: white;
    top: 45%;
    left: 50%;
    transform: translate(-50%, -50%);
    border-radius: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.4);
    height: auto;
    width: 400px;
    font-size: large;
  }
  #login input{
    display: block;
    width: 66%;
    margin-left: 16%;
    margin-top: 2%;
    font-size: large;
  }
  #login input[type="submit"]{
    margin-bottom: 20px;
  }
  #login_title {
    font-size: 30px;
  }
  #login h1 {
    margin-bottom: 4%;
  }
</style>
