export  default{
  'GET /api/name':{name:[1,2]},
  '/api/name/1':{id:1},
  'POST /api/name/create':(req,res)=>{
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.end('ok');
}
}
