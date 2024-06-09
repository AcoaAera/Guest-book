import VueRouter from "vue-router";

import PageIndex from "./page/PageIndex.vue";
import PageAddMessage from "./page/PageAddMessage.vue";
import PageHistory from "./page/PageHistory.vue";

const router = new VueRouter({
    // mode: 'history',

    routes: [
        {
            path: "/",
            name: "index",
            component: PageIndex,
        },
        {
            path: "/add-message",
            name: "add-message",
            component: PageAddMessage,
        },
        {
            path: "/history",
            name: "history",
            component: PageHistory,
        },
    ],
});

export default router;
