import Vue from 'vue';
import Vuex from 'vuex';
//import post from './modules/post';
import loader from "./modules/loader";
import dish from './modules/dish';
import user from './modules/user';
import products from './modules/products';
import menus from './modules/menus';

Vue.use(Vuex);
//export const store = new Vuex.Store({ - , it was like that and there was a long-term error, since const store is essentially an object declared in api.php and if they didn’t export it but wrote it directly, they would write this option
export default new Vuex.Store({
    //In general, logically, these methods are often left here, but we will put them in a module to make it easier for us, since there can be hundreds of functions
   /*state: {},getters: {}, mutations: {}, actions: {},*/

  modules:{loader, dish, user, products, menus}
});
