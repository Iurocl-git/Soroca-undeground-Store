<script setup>

  const props = defineProps({
    img: String,
    name: String,
    description: String
  })

</script>

<template>
    <figure class="participantFig figure_mob">
      <img :src="img" :alt="name" class="participantImg col-4" >
      <figcaption class="participantCap caption_mob col-7">

        <h2><strong>{{ name }}</strong> </h2>
        <p>{{ description }}</p>

      </figcaption>
    </figure>
</template>

<style scoped>
  .participantFig {
    margin: 25px 0px;
    display: block;
    position: relative;
    min-height: 100px;
  }
  .participantImg {
    border-radius: 50%;
    width: 200px;
    max-width: 200px;
    height: 200px;
    margin: 0px 25px;
    object-fit: cover;
  }
  .participantCap {
    display: inline-block;
    position: absolute;
    top: 50%;
    transform: translate(0%, -50%); 
  }
  @media only screen and (max-width: 1024px) {
    .participantCap * {
      text-align: center;
      width: 50%;
      margin: 0 auto; 
    }

    .participantCap {
      position: static;
      transform: translate(0%, 0%); 
    }
}

</style>