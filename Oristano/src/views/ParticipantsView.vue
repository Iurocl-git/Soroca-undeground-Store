<script setup>
  import UserCard from "@/components/UserCard.vue"
  // import { getUsers } from "@/utils/apis";
  // import { onMounted, reactive } from "vue";

  // const userData = reactive({username: []}) 

  // const getUsersData = async () => {
  //   const data = await getUsers();
  //   console.log(data);
  // }
  // onMounted(getUsersData);
  
</script>

<template>
  <section>
    <h1 class="page_title">Participants of the project</h1>
    <article class="participants">
      <UserCard img="src/assets/img/Ioan_img.png" name="Ioan Motresku" description="Ioan is a creative and empathetic boy with a vivid imagination and a passion for reading and exploring cultures. Quiet and thoughtful, he enjoys drawing and writing, and is valued by friends for his honesty and good advice." class="userCard"></UserCard>
      <UserCard img="src/assets/img/Bogdan_img.jpg" name="Bogdan-Ioan Rusu" description="Bogdan is an intelligent and curious boy with a passion for learning and exploring. Friendly and eager to make friends, he enjoys participating in sports, art, and science. His cheerful personality brings positivity to his group." class="userCard"></UserCard>
    </article>
  </section>
</template>

<style scoped>
  .participants {
    padding-left: 15px;
  }
  .userCard{
      margin: 40px 0px;
    }
  @media only screen and (max-width: 1024px) {
    .participants {
      text-align: center;
      padding-left: 0px;
    }
  }
</style>