
<template>
  <header class="col-12" id="header">
    <img src="../assets/img/Logo.png" alt="Logo" height="120" >
    <h2>Soroca Underground Store</h2>
  </header>
</template>

<style scoped>
  header {
    color: rgb(255, 255, 255);
    background-color: #9e191f;
    padding: 20px;
  }
  #header img{

    width: 120px;
    object-fit: cover;
    vertical-align: middle;
  }

  #header h2 {
    display: inline-block;
    vertical-align: middle;
  }

  @media (max-width: 1024px){
    #header {
      text-align: center;
      padding: 40px;
    }
    #header h2{
      display: block;
    }
  }
</style>

