<script setup>
  import AboutUs from '@/components/AboutUs.vue'
  import GameCollage from '@/components/GameCollage.vue'
  import { useSessionStore } from '@/stores/session';

  const sessionStore = useSessionStore();

</script>

<template>
  <div class="main_content">
    <article id="welcome" >
      <h1 class="page_title" v-if="sessionStore.getUser()">Welcome back to the home page, {{ sessionStore.getUser() }}!</h1>
      <h1 class="page_title" v-else>Welcome to the home page!</h1>
      <p>Welcome to our ultimate gaming destination! Whether you're a seasoned gamer or just starting out, we offer a wide selection of games, insights, and a vibrant community that shares your passion. Explore our store, discover new favorites, and connect with fellow gamers. We're here to make your gaming experience unforgettable. Happy gaming!</p>
      <GameCollage class="gameCollage"></GameCollage>
    </article>

    <AboutUs></AboutUs>    
  </div>
</template>

<style scoped>
  #welcome {
    text-align: center;
    padding: 20px;
  }
  #img_list  {
    text-align: center;
  }
  .main_content {
    padding: 0px 30px;
    font-size: large;
    margin-bottom: 20px;
  }
  .gameCollage {
    margin: 60px 0px;
  }
</style>