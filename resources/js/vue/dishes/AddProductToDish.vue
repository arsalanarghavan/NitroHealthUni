<template>
    <div>
        <p v-if="oneDish">ظرف: <b>{{oneDish[0].name}}</b></p>
        <div>
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">محصول</th>
                    <th scope="col">وزن ناخالص</th>
                    <th scope="col">وزن خالص</th>
                </tr>
                </thead>
                <tbody>
                <tr v-for="(product, index) in productsOfDish" :key="index">
                    <td>1</td>
                    <td>{{product.products.name}}</td>
                    <td>{{product.gross_weight}}</td>
                    <td>{{product.net_weight}}</td>
                </tr>
                </tbody>
            </table>
            <p class="text-center">اضافه کردن غذا به ظرف</p>
            <form id="dataForm" @submit.prevent="addProduct()">
                <div class="row">
                    <div class="col-4">
                        <label for="products_id"><b>محصول را انتخاب کنید</b></label>
                        <select id="products_id" class="form-control" v-model="form.products_id">
                            <option v-for="(product, index) in allProducts" :key="index" :value="product.id">
                                {{product.name}}
                            </option>
                        </select>
                    </div>
                    <div class="col-4">
                        <label for="gross_weight"><b>وزن ناخالص</b></label>
                        <input autocomplete="off" id="gross_weight" class="form-control" type="text" v-model="form.gross_weight">
                    </div>
                    <div class="col-4">
                        <label for="net_weight"><b>وزن خالص</b></label>
                        <input autocomplete="off" id="net_weight" class="form-control" type="text" v-model="form.net_weight">
                    </div>
                </div>
                <div class="row" style="width: 100%">
                    <button class="btn main-button-green mt-3">اضافه کردن محصول</button>
                </div>
            </form>
        </div>
    </div>
</template>
<script>
    import {mapGetters, mapActions} from 'vuex'

    export default {
        props: ['dishes_id'],
        data: function () {
            return {
                form: {
                    products_id: null,
                    dishes_id: null,
                    net_weight: null,
                    gross_weight: null,
                }

            }
        },
        computed: mapGetters(['oneDish', 'productsOfDish', 'allProducts']),
        methods: {
            ...mapActions(['getOneDish', 'getProductsDish', 'getProducts', 'newProductsDish']),
            addProduct() {
                this.form.dishes_id = this.oneDish[0].id;
                this.newProductsDish({
                    form: this.form
                }).then(response => {
                    this.form.products_id = '';
                    this.form.net_weight = '';
                    this.form.gross_weight = '';
                }).catch(error => {
                    console.log(error);
                });
            },
        },
        async created() {
            this.getProducts();
            this.getOneDish(this.dishes_id);
            this.getProductsDish(this.dishes_id);
        },
    }
</script>
