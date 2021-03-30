import Vue from "vue";
import Router from 'vue-router'
import Home from "./pages/Home";
import Datastream from "./pages/Datastream";

Vue.use(Router)

/**
 * Router from Vue. Associate pages with paths.
 * @type {VueRouter}
 */
const router = new Router({
    mode: 'history',
    base:'/fast-and-slow-demo/',
    routes: [
        {
            path: '/',
            component: Home
        },
        {
            path:'/event-stream',
            name: "EventstreamDetails",
            props: true,
            component: Datastream
        }
    ]
});

export default router
