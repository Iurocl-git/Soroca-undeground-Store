<script setup>
  import AddProduct from "@/components/AddProduct.vue";
  import { useSessionStore } from "@/stores/session";
  import {postProduct} from "@/utils/apis.js";


  async function post(data) {
    data.username = useSessionStore().getUser();
    console.log(data);
    const response = await postProduct(data);
    if (response.message)
      alert(response.message);  
    else
      alert(response);
  };

</script>

<template>
  <article>
    <h1 class="page_title">Adding a new product</h1>
    <AddProduct id="add_elem" @new_product="post"></AddProduct>
  </article>
</template>

<style scoped>
  #add_elem {
    margin: 0px auto;
  }
</style>