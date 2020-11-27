<%--
  Created by IntelliJ IDEA.
  User: 15313
  Date: 2020/8/4
  Time: 10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="js/three.js"></script>
    <script src="js/OrbitControls.js"></script>
</head>
<body>
<script>
    //场景
    var scene=new THREE.Scene();

    //相机
    var camera=new THREE.PerspectiveCamera(75,window.innerWidth/window.innerHeight,0.1,1000)

    //渲染器
    var renderer=new THREE.WebGLRenderer();
    renderer.setSize(window.innerWidth,window.innerHeight);
    document.body.appendChild(renderer.domElement);

    //创建一个立方体
    var  geometry=new THREE.BoxGeometry(100,100,100);
    //设置颜色
    var material=new THREE.MeshBasicMaterial({
        color:0xffff00
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
    scene.add(point);

    //环境光
    var ambient=new THREE.AmbientLight(0x444444);
    scene.add(ambient);


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
    //controls.addEventListener('change',renderer);



</script>

</body>
</html>
