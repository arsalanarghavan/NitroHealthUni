<template>
    <header>
    <nav class="navbar navbar-expand-lg navbar-light navbar-float">
      <div class="container">
        <a href="index.html" class="navbar-brand">Nitro<span class="text-primary">Health</span></a>
        <button class="navbar-toggler" data-toggle="collapse" data-target="#navbarContent" aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="navbar-collapse collapse" id="navbarContent">
          <ul class="navbar-nav ml-lg-4 pt-3 pt-lg-0">
            <!-- <li class="nav-item active">
              <a href="index.html" class="nav-link">Home</a>
            </li> -->
            <li class="nav-item"><router-link class="nav-link" :to="{name: 'products'}">محصولات</router-link></li>
            <li class="nav-item"><router-link class="nav-link" :to="{name: 'dishes'}">ظرف‌ها</router-link></li>
            <li class="nav-item"><router-link class="nav-link" :to="{name: 'menus'}">منوی غذایی</router-link></li>
            <li class="nav-item"><router-link class="nav-link" :to="{name: 'menus-dishes'}">غذاها</router-link></li>
            <li class="nav-item"><router-link class="nav-link" :to="{name: 'report'}">گزارش</router-link></li>
            <li class="nav-item"><router-link class="nav-link" :to="{name: 'cabinet'}">حساب کاربری</router-link></li>
          </ul>
          <div class="ml-auto">
            <!-- <a href="#" class="btn btn-outline rounded-pill">Get a Quote</a> -->
          </div>
        </div>
      </div>
    </nav>
    <!-- https://www.free-css.com/free-css-templates/page273/digigram  STYLE-->
  </header>
</template>

<script>
    export default {
        name: "Auth"
    }
</script>

<style scoped>

</style>
