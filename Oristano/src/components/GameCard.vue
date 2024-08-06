<script setup>
  import { computed } from 'vue';
  const props = defineProps({
    img: {
      type: String,
      default: 'DefaultGameImg'
    },
    name: {
      type: String,
      default: 'Default_Name'
    },
    description: {
      type: String,
      default: 'Default_Description'
    },
    genre: {
      type: String,
      default: 'Default_Genre'
    },
    rating: {
      type: Number,
      default: 10
    },
    price: {
      type: Number,
      default: 30
    },
  });
  const img_path = props.img ? computed(() =>"src/assets/img/games/" + props.img + ".jpg") : 'src/assets/img/games/DefaultGameImg.jpg';
</script>

<template>
    <figure class="catalog_fig">
      <img class="catalog_img" :src="img_path" :alt="'Image of the game: ' + name" >
      <figcaption class="col-9 catalog_cap">
        <section class="col-10 ">
          <h2>{{ name }}</h2>
          <p><i>{{ genre }} {{ rating }}/10</i></p>
          <p>{{ description }}</p>
        </section>
        <p class="price col-2"><strong>{{ price }}€</strong></p>
      </figcaption>
    </figure>
</template>

<style scoped>
  .catalog_fig {
    display: flex;
    place-items: center;
    padding: 19px 22px;
    height: 150px;
    background-color: white;
    transition: box-shadow 0.3s ease; 
  }
  .catalog_fig:hover {
    box-shadow: 0 0px 12px rgba(0, 0, 0, 0.3);
  }
  .catalog_img {
    width: 180px;
    height: 100px;
    object-fit: cover;
  }
  .price {
    text-align: right;
  }
  .catalog_cap {
    padding-left: 15px;
    display: flex;
    flex-wrap: wrap;
    align-items: center;
  }
  .catalog_cap p {
  display: -webkit-box;
  -webkit-line-clamp: 2; 
  -webkit-box-orient: vertical;
  overflow: hidden;
  text-overflow: ellipsis;
  }

  @media only screen and (max-width: 1024px) {
    .catalog_cap p {
    -webkit-line-clamp: 3; 
    }
    .catalog_fig {
      display: block;
      width: 344px;
      height: 409px;
    }
    .catalog_img {
      width: 300px;
      height: 200px;
    }
    .catalog_cap {
      padding-left: 0px;
    }
    .price {
      text-align: center;
    }
  }

</style>

