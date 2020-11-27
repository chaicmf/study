import { defineConfig } from 'umi';

export default defineConfig({
  layout:{},
  nodeModulesTransform: {
    type: 'none',
  },
  /*routes: [
    {
      path: '/',
      component: '@/pages/index' ,
      routes:[
        {path: '/users', component: '@/pages/users' },
    ]
    },
  ],*/
 /* routes: [
    {exact:true,path: '/',redirect:'/users' },
    {exact:true,path: '/users',component: '@/pages/users' },
  ],*/
   routes: [
    {path: '/',component: '@/pages/index',title:'首页' },
    {path: '/users',component: '@/pages/users'},
  ],

});
