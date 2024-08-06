<script setup>
  import {reactive, watch, defineEmits} from "vue";

  const dataProduct = reactive({
    name: '',
    description: '',
    genre: '',
    rating: 1,
    price: 1,
  });
  const emits = defineEmits(['new_product']);

  const maxChar = {
    name: 30,
    description: 80,
    genre: 30,
  };
  const maxValue = {
    rating: 10,
    price: 1000,
  }
  const numberStyle = reactive({
    rating: {color: "black"},
    price: {color: "black"},
  })

  function newProduct () {
    emits('new_product', {
      name: dataProduct.name,
      description: dataProduct.description,
      price: dataProduct.price,
      username: '',
      genre: dataProduct.genre,
      rating: dataProduct.rating,
    });
  };

  function checkNumChar(type) {
    if(dataProduct[type].length > maxChar[type]) {
      dataProduct[type] = dataProduct[type].substring(0, maxChar[type]);
    }
  }

  function checkValue(type) {
    if(dataProduct[type] > maxValue[type] || dataProduct[type] < 1) {
      numberStyle[type].color = 'red';
      return true;
    } else {
      numberStyle[type].color = 'black';
      return false;
    }
  }

  function checkData() {
    for(let key in maxChar) {
      if(dataProduct[key].length > maxChar[key] || dataProduct[key] == '') { return true }
    }
    for(let key in maxValue) {
      if(dataProduct[key] > maxValue[key] || dataProduct[key] < 1 ) { return true }
    }
    return false
  }

  watch(() => dataProduct.rating, () => {checkValue('rating'); });
  watch(() => dataProduct.price, () => {checkValue('price')});

</script>

<template>

  <section class="add_element">
    <img src="../assets/img/games/DefaultGameImg.jpg" alt="Default game Img" height="130px">
    <form action="addGame" method="POST">
      <h2>Add new game</h2>

      <label for="new_name" >Name</label>
      <input type="text" name="new_name" v-model="dataProduct.name" @input="checkNumChar('name')" >
      <p class="char_left">{{ dataProduct.name.length }}/{{ maxChar.name }}</p>

      <label for="new_description">Description</label>
      <textarea type="text" name="new_description"  v-model="dataProduct.description" @input="checkNumChar('description')"></textarea>
      <p class="char_left">{{ dataProduct.description.length }}/{{ maxChar.description }}</p>

      <label for="new_genre">Genre</label>
      <input type="text" name="new_genre" v-model="dataProduct.genre" @input="checkNumChar('genre')">
      <p class="char_left">{{ dataProduct.genre.length }}/{{ maxChar.genre }}</p>

      <label for="new_Rating">Rating</label>
      <input type="number" name="new_Rating" :style="numberStyle.rating" v-model="dataProduct.rating">
      <p v-if="checkValue('rating')" class="bad_value"><i>The value must be between 1 and 10!</i></p>
      <p><br></p>

      <label for="new_Price">Price $</label>
      <input type="number" name="new_Price" :style="numberStyle.price" v-model="dataProduct.price">
      <p v-if="checkValue('price')" class="bad_value"><i>The value must be between 1 and 1000!</i></p>
      <p><br></p>

      <input :disabled="checkData()" type="submit" value="Post" id="post" @click.stop.prevent="newProduct">
    </form>
  </section>
</template>

<style scoped>
  .add_element {
    display: flex;
    flex-wrap: wrap;
    padding: 20px;
    background-color: white;
    box-shadow: 0 0px 8px rgba(0, 0, 0, 0.3);
    border-radius: 10px;
    align-items: center;
    width: fit-content;
    height: fit-content;
  }
  .add_element img {
    border-radius: 10px;
  }
  .add_element label{
    display: inline-block;
    width: 150px;
    padding-right: 15px;
    padding-left: 20px;
    font-size: 20px;
    vertical-align: top;
  }
  .add_element input, .add_element textarea  {
    width: 220px;
    font-size: large;
  }
  .add_element textarea {
    height: 4em;
    font-size: large;
  }
  .add_element h2 {
    text-align: center;
    padding: 20px
  }
  .add_element p {
    text-align: right;
  }
  .bad_value {
    font-size: small;
  }
  #post {
    display: block;
    margin: 0px auto;
    font-size: larger;
  }
  @media only screen and (max-width: 1024px) {
    .add_element {
      flex-direction: column;
    }
    .add_element input, .add_element label, .add_element textarea, .add_element .bad_value  {
      width: 100%;
      text-align: center;
      padding: 0px;
    }
    .add_element img {
      height: 200px;
    }
    .char_left {
    margin-bottom: 20px;
    }
  }
</style>

