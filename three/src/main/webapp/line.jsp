<%--
  Created by IntelliJ IDEA.
  User: 15313
  Date: 2020/8/3
  Time: 15:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Deawing lines</title>
</head>
    <script src="js/three.js"> </script>

<body>
<script>
    //场景
    var scene=new THREE.Scene();


    // 相机
    var camera=new THREE.PerspectiveCamera(45,window.innerWidth/window.innerHeight,1,500)
    camera.position.set(0,0,100)
    camera.lookAt(0,0,0);
    // 渲染器
    var renderer=new THREE.WebGLRenderer();
    renderer.setSize(window.innerWidth,window.innerHeight);
    document.body.appendChild(renderer.domElement);


    //定义材质
    var material=new THREE.LineBasicMaterial({
        color:0x0000ff
    });

    var geometry=new THREE.Geometry();
    geometry.vertices.push(new THREE.Vector3(-10,0,0))
    geometry.vertices.push(new THREE.Vector3(0,10,0))
    geometry.vertices.push(new THREE.Vector3(10,0,0))

    var line=new THREE.Line(geometry,material);

    scene.add(line);
    renderer.render(scene,camera)

</script>

</body>
</html>
