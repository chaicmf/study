<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>My first three.js app</title>
    <style>
        body {
            margin: 0;
        }
        canvas {
            width: 100%;
            height: 100%
        }
    </style>
</head>
<body>
<script src="js/three.js"></script>
<script src="js/OrbitControls.js"></script>
<script>
 //three.js需要创建场景，相机，渲染器

    //场景
    var  scene=new THREE.Scene();

    //相机   PerspectiveCamera 透视摄像机(视野角度，长宽比，近截面，远截面)
    var camera=new THREE.PerspectiveCamera(75,window.innerWidth/window.innerHeight,0.1,1000);

    //渲染器
    var renderer=new THREE.WebGLRenderer();
    renderer.setSize(window.innerWidth,window.innerHeight);
    document.body.appendChild(renderer.domElement);

    //创建一个立方体
    var geometry=new THREE.BoxGeometry(100,100,100);
    console.log(geometry);
    console.log("几何体顶点位置数据",geometry.vertices);
    console.log('三角形面数据',geometry.faces);
    //pop()删除数组最后一个元素  shift删除数据第一个元素
    //geometry.faces.pop();
   // geometry.faces.shift();
   /* geometry.faces.forEach(face=>{
        //设置三角面face单个顶点的颜色
        face.vertexColors=[
            new THREE.Color(0xffff00),
            new THREE.Color(0xff00ff),
            new THREE.Color(0x00ffff),
        ]
    })*/
    var material=new THREE.MeshBasicMaterial({
        color:0x0000ff
        //vertexColors:THREE.FaceColors
    });
    var  cube=new THREE.Mesh(geometry,material);
    scene.add(cube);
    camera.position.set(200,300,200);
    camera.lookAt(scene.position)

 /**
  * 光源位置
  */
 //点光源
 var point=new THREE.PointLight(0xffffff);
 point.position.set(400,200,300);
 //scene.add(point);

 //环境光
 var ambient=new THREE.AmbientLight(0x444444);
 //scene.add(ambient);
 //聚光光源
 var spotLight=new THREE.SpotLight(0xffffff);
 var spotLight = new THREE.SpotLight(0xffffff);
 // 设置聚光光源位置
 spotLight.position.set(50, 90, 50);
 // 设置聚光光源发散角度
 spotLight.angle = Math.PI /6
 scene.add(spotLight); //光对象添加到scene场景中
 // 设置用于计算阴影的光源对象
 spotLight.castShadow = true;
 // 设置计算阴影的区域，注意包裹对象的周围
 spotLight.shadow.camera.near = 1;
 spotLight.shadow.camera.far = 300;
 spotLight.shadow.camera.fov = 20;


let T0=new Date();
 function animate(){
     let T1=new Date();
     let t=T1-T0;
     T0=T1;
        requestAnimationFrame(animate);
        //cube.rotation.x+=0.01;

        renderer.render(scene,camera);
        cube.rotateY(0.001*t)
    }
    animate();
 var controls=new THREE.OrbitControls(camera,renderer.domElement);





</script>
</body>
</html>