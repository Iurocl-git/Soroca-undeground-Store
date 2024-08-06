<script setup>
import { RouterLink, RouterView, useRoute} from 'vue-router'
import { onMounted } from 'vue'
import { useSessionStore } from './stores/session'
import { isLogged } from './utils/auth'
import Header from "@/components/Header.vue"
import Navbar from "@/components/Navbar.vue"
import Footer from "@/components/Footer.vue"
import Sidebar from "@/components/Sidebar.vue"
const route = useRoute();

onMounted ( async () => {
  // const data = await isLogged();
  // console.log(data.userID);
  // if(data.userID) {
  //   useSessionStore().setUser(data.userID);
  // }
})

</script>

<template>
      <Header id="header" class="col-12" v-show="route.path!='/login'"></Header> 
      <Navbar id="nav" class="col-12" :path=route.path v-show="route.path!='/login'"></Navbar>
    
      <section class="container_main col-12">
        <RouterView id="mainContent" class="col-8"></RouterView>
        <Sidebar id="Sidebar" class="col-4" v-show="route.path!='/login'"></Sidebar>
      </section>
    
      <Footer id="footer"  v-show="route.path!='/login'"></Footer>
</template>

<style scoped>
  .container_main {
    margin-bottom: 20px;
  }    
  #mainContent {
    display: inline-block;
  }
  #Sidebar {
    display: inline-block;
    vertical-align: top;
  }
  @media only screen and (min-width: 1025px) {
    #nav {
    position: sticky;
    top: 0px;
    } 
  }

</style>
