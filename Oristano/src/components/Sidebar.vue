<script setup>
  import Section from "@/components/Section.vue"
  import {getAds} from "@/utils/apis";
  import { onMounted, ref } from "vue";


  async function getAdsData () {
    const data = await getAds();
    adsData.value = data;
    adsData.value.sort((a, b) => new Date(b.date) - new Date(a.date));
    console.log(adsData.value);
  }

  const adsData = ref([]);

  onMounted(() => {getAdsData()});
</script>

<template>
  <aside class="col-4">
    <Section v-for="ad in adsData" :key="ad.id" class="content" :title="ad.title" :text="ad.description" :date="ad.date"></Section>
  </aside>
</template>

<style scoped>
  aside {
    padding: 10px;
  } 
  .content {
    padding: 5px;
    margin: 10px;
  }
</style>