<template>
  <div style="width:90%; margin: 0 auto;">
    <FlashMessage :position="'right top'"></FlashMessage>
    <h1 class="text-center">لیست محصولات</h1>
    <b-button v-b-modal.modal-1 class="mb-4 main-button-green">افزودن محصول جدید</b-button>
    <b-modal id="modal-1" class="mb-4" size="lg" title="افزودن محصول جدید" hide-footer="true">
      <addProduct />
    </b-modal>
    <table class="fl-table">
      <thead>
        <tr>
          <th scope="col">ترتیب</th>
          <th scope="col">نام</th>
          <th scope="col">دسته‌بندی</th>
          <th scope="col">پروتئین</th>
          <th scope="col">چربی</th>
          <th scope="col">کربوهیدرات</th>
          <th scope="col">ویتامین А</th>
          <th scope="col">ویتامین B1</th>
          <th scope="col">ویتامین B2</th>
          <th scope="col">کنترل</th>
        </tr>
      </thead>
      <tbody>
        <tr v-if="allProducts.length === 0 && getLoading === false">
          <td class="text-center text-danger" colspan="10"><b>داده یافت نشد!</b></td>
        </tr>
        <tr v-else-if="getLoading === true" style="border:none">
          <td class="text-center text-danger" colspan="10">
            <Loader />
          </td>
        </tr>
        <tr v-else v-for="(myProduct, index) in allProducts" :key="index">
          <td>{{myProduct.id}}</td>
          <td>{{myProduct.name}}</td>
          <td>{{myProduct.products_categories.name}}</td>
          <td>{{myProduct.protein}}</td>
          <td>{{myProduct.fat}}</td>
          <td>{{myProduct.carbohydrates_total}}</td>
          <td>{{myProduct.vitamin_a}}</td>
          <td>{{myProduct.vitamin_b1}}</td>
          <td>{{myProduct.vitamin_b2}}</td>
          <td class="text-center">
            <b-button variant="danger" @click="removeProducts(myProduct.id)">
              <font-awesome-icon icon="trash" />
            </b-button>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import addProduct from './AddProduct'
import Loader from "../helpers/Loader";
import { mapGetters, mapActions } from 'vuex'

export default {
  components: { addProduct, Loader },
  data: function () {
    return {
    }
  },
  computed: mapGetters(['allProducts', 'getLoading']),
  methods: {
    ...mapActions(['getProducts', 'deleteProduct']),
    removeProducts(id) {
      this.deleteProduct(id)
        .then(response => {
          this.flashMessage.success({
            message: 'محصول با موفقیت حذف شد',
            time: 3000,
          });
        });
    }

  },

  async mounted() {
    this.getProducts()
  },
}

</script>
