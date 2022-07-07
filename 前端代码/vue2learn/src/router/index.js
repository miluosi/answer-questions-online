import Vue from 'vue'
import VueRouter from 'vue-router'
import Blog from "../views/Blog";
import Login from "../views/Login";
import Questions from "../views/Questions";
import Questionsolve from "../views/Questionsolve";
import Questionfinished from "../views/Questionfinished";
import Register from "../views/Register";
import Questioncheck from "../views/Questioncheck";
import Collqs from "../views/Collqs";
import Wrongqs from "../views/Wrongqs";
import AdminInfo from "../views/AdminInfo";
import Knowledge from "../views/Knowledge";
import Teacher from "../views/Teacher";
import Pigai from "../views/Pigai";
import Correctfinish from "../views/Correctfinish";
import Teacherinfo from "../views/Teacherinfo";
import reco from "../views/reco";
import Tknowledge from "../views/Tknowledge";
import Alknowledge from "../views/Alknowledge";
import AddKnowledge from "../views/AddKnowledge";
import Addques from "../views/Addques";

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Login',
    component: Login
  },
  {
    path: '/login',
    name: 'Login',
    component: Login
  },
  {
    path: '/register',
    name: 'Register',
    component: Register
  },
  {
    path: '/teacherinfo',
    name: 'Teacherinfo',
    component: Teacherinfo
  },
  {
    path: '/reco',
    name: 'Reco',
    component: reco
  },
  {
    path: '/teacher',
    name: 'Teacher',
    component: Teacher
  },
  {
    path: '/correctfinish',
    name: 'Correctfinish',
    component: Correctfinish
  },
  {
    path: '/knowledge',
    name: 'Knowledge',
    component: Knowledge,
  },
  {
    path: '/tknowledge',
    name: 'TKnowledge',
    component: Tknowledge,
  },
  {
    path: '/question/:questionId',
    name: 'Questionsolve',
    component: Questionsolve
  },
  {
    path: '/alknowledge/:knowledgeId',
    name: 'Alknowledge',
    component: Alknowledge
  },
  {
    path: '/addknowledge',
    name: 'AddKnowledge',
    component: AddKnowledge
  },
  {
    path: '/addques',
    name: 'Addques',
    component: Addques
  },
  {
    path: '/pigai/:userid/:qsid/:id',
    name: 'Pigai',
    component: Pigai
  },
  {
    path: '/collqs/:userId',
    name: 'Collqs',
    component: Collqs
  },
  {
    path: '/wrongqs/:userId',
    name: 'Wrongqs',
    component: Wrongqs
  },
  {
    path: '/questioncheck/:userid/:id',
    name: 'Questioncheck',
    component: Questioncheck
  },
  {
    path: '/userinfo',
    name: 'Userinfo',
    component: AdminInfo
  },
  {
    path: '/questionfinished/:userId',
    name: 'Questionfinished',
    component: Questionfinished
  },
  {
    path: '/question',
    name: 'Questions',
    component: Questions
  }
]

const router = new VueRouter({
  routes
})

export default router
