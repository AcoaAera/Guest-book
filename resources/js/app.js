require("./bootstrap");

window.Vue = require("vue").default;

import VueRouter from "vue-router";
Vue.use(VueRouter);
import router from "./routers";

import App from "./components/AppComponent.vue";

import Vuetify from "vuetify";
import "vuetify/dist/vuetify.min.css";
Vue.use(Vuetify);

const app = new Vue({
    el: "#app",
    router,
    vuetify: new Vuetify(),
    render: (h) => h(App),
});
