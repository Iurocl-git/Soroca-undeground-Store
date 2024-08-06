import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import ProductsView from '../views/ProductsView.vue'
import ParticipantsView from '../views/ParticipantsView.vue'
import AddProductView from '../views/AddProductView.vue'
import AuthenticationView from '../views/AuthenticationView.vue'
import { useSessionStore } from '@/stores/session'
import * as Auth from '@/utils/auth'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView,
    },
    {
      path: '/products',
      name: "products",
      component: ProductsView,
      meta: { requiresAuth: true }
    },
    {
      path: '/participants',
      name: 'participants',
      component: ParticipantsView
    },
    {
      path: '/addProduct',
      name: 'addP',
      component: AddProductView,
      meta: { requiresAuth: true }
    },
    {
      path: '/login',
      name: 'login',
      component: AuthenticationView
    },
    
  ]
})

router.beforeEach(async (to, from, next) => {
  const sessionStore = useSessionStore();
  if (to.matched.some(record => record.meta.requiresAuth)) {
      const userID = sessionStore.getUser();
      const data = await Auth.isLogged();
      console.log(data.userID);
      if (userID === null || userID !== data.userID) {
          next({
              path: '/login',
              query: { redirect: to.fullPath }
          });
      } else {
          next();
      }
  } else {
      next();
  }
})


export default router
