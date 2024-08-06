<script setup>
  import { defineProps} from 'vue';
  import { useRouter } from 'vue-router';
  import { useSessionStore } from '@/stores/session';
  import * as Auth from '@/utils/auth';

  const router = useRouter();
  const props = defineProps({
    path: String
  });

  const isActive = (navLocation) => {
    return props.path === navLocation;
  };
  const checkUser = () => {
    return !(useSessionStore().getUser() === null);
  };
  const navigate = (path) => {
    router.push(path);
  };
  const logout = async () => {
    await Auth.logout();
    useSessionStore().setUser(null);
    router.push('/');
  }
</script>

<template>
  <nav>
    <ul>
      <li :class="{active: isActive('/')}"  @click="navigate('/')" ><router-link to="/"> Home</router-link></li>
      <li v-show="checkUser()" :class="{active: isActive('/products')}" @click="navigate('/products')"><router-link to="/products">Products</router-link></li>
      <li v-show="checkUser()" :class="{active: isActive('/addProduct')}"  @click="navigate('/addProduct')" ><router-link to="/addProduct">Add Product</router-link></li>
      <li :class="{active: isActive('/participants')}" @click="navigate('/participants')"><router-link to="/participants">Participants</router-link></li>
      <li v-show="!checkUser()" :class="{active: isActive('/login')}" @click="navigate('/login')" ><router-link to="/login">Login</router-link></li>
      <li v-show="checkUser()" :class="{active: isActive('/login')}" @click.stop.prevent="logout()" ><a>Logout</a></li>
    </ul>
  </nav>
</template>

<style scoped>
nav{
  display: block;
  background-color: #9c0505;
  z-index: 1000;
  text-align: center;
}
nav li{
  list-style: none;
  display: inline-block;
  padding: 10px;
  cursor: pointer
}
a{
  font-size: 20px;
  text-decoration: none;
  color: white;
}
li.active {
  padding: 5px 10px;
  border-bottom: 6px solid #f3f3f3;
}
@media (max-width: 1024px){
  nav li{
    display: block;
  }
  li.active {
    padding: 10px;
    border-bottom: 0;
    border-left: 6px solid #f3f3f3;
    border-right: 6px solid rgba(0,0,0,0);
  }
}
</style>