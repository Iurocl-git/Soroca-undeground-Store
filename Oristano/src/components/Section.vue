<script setup>
import { computed, defineProps} from 'vue';

const props = defineProps ({
  title: String,
  text: String,
  date: String,
});

const formatted_date = computed(() => {return (new Date(props.date)).toLocaleDateString()})
</script>

<template>
  <article >
      <section class="aside_section">
        <h3 class="aside_title"><b>{{title}} </b></h3>
        <br>
        <p>{{text}}</p>
        <br>
        <p class="aside_date">{{ formatted_date }}</p>
      </section>
  </article>
</template>

<style scoped>
  .aside_section {
    border: 2px solid white;;
    background-color: white; 
    border-radius: 15px;
    padding: 15px;
    box-shadow: 0 0px 8px rgba(0, 0, 0, 0.3);
  }
  .aside_title {
    padding-bottom: 8px;
  }
  .aside_date {
    text-align: right;
  }

</style>