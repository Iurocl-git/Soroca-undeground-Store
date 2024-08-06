<script setup>
  import GameCard from '@/components/GameCard.vue';
  import * as API from '@/utils/apis.js';
  import {ref, reactive, onMounted} from 'vue';

  const products = reactive ({values: [], search_name: ''});
  const searchSettings = ref('');

  async function getProducts() {
    let data = await API.getProducts();
    // console.log(data);
    products.values = data;
  };

  function checkGame (name) {
    return name.toUpperCase().includes(products.search_name.toUpperCase()) || products.search_name === '';
  }

  onMounted ( () => {
    getProducts();
  });

</script>

<template>
  
  <article>
    <h1 class="page_title">Game Store</h1>
    <section class="main_catalog col-12">
      <section id="search_bar">
        <input type="text" name="game_search" id="game_search" class="col-12" v-model="searchSettings" @keyup.enter.stop.prevent="products.search_name = searchSettings" >
        <img src="../assets/img/loop.webp" alt="Logo" height="40" >
      </section>
      <ul>
        <li  class="main_catalog catalog_li" v-for="product in products.values" :key="product.id" >
          <GameCard v-if="checkGame(product.name)" class="GameCard" :name="product.name" :description="product.description" :genre="product.genre" :rating=Number(product.rating) :price=Number(product.price) :img="product.image_name"></GameCard>
        </li>
      </ul>
    </section>
  </article>
</template>

<style scoped>
  .main_catalog {
    display: block;
    margin-top: 10px;
    margin-bottom: 10px;
    padding-left: 30px;
  }
  .catalog_li {
    padding-left: 0px;
  }
  .main_catalog > ul {
    list-style-type: none;
  }
  .GameCard  {
    margin-bottom: 10px;
  }
  #game_search {
    font-size: large;
    padding: 10px;
    padding-left: 60px;
  }
  #search_bar {
    position: relative;
    margin-bottom: 40px;
  }
  #search_bar img{
    position: absolute;
    top: 50%;
    left: 10px;
    transform: translate(0%, -50%);
  }

  @media only screen and (max-width: 1024px) {
    .main_catalog {
      display: inline-block;
      text-align: center;
      padding: 0px 60px;
    }
    .catalog_li {
      padding: 0px;
    }
    .GameCard {
      margin: 0px 20px;
      margin-bottom: 50px;
    } 
  }
</style>
