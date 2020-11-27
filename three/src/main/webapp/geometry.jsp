<%--
  Created by IntelliJ IDEA.
  User: 15313
  Date: 2020/8/4
  Time: 11:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>geometry </title>
</head>
<body>
<script src="js/three.js"></script>
<script src="js/OrbitControls.js"></script>
<script>
    //创建场景
    var  scene=new THREE.Scene();
    //创建相机
    var camera=new THREE.PerspectiveCamera(75,window.innerWidth/window.innerHeight,0.1,1000)
    camera.position.set(200,300,200);
    camera.lookAt(scene.position)
    //创建渲染器
    var renderer=new THREE.WebGLRenderer();
    renderer.setSize(window.innerWidth,window.innerHeight);
    document.body.appendChild(renderer.domElement);

    //光源
    //点光源
    //聚光光源
    var spotLight = new THREE.SpotLight(0xffffff);
    // 设置聚光光源位置
    spotLight.position.set(90,100,50);
    // 设置聚光光源发散角度
    spotLight.angle = Math.PI /6
    scene.add(spotLight); //光对象添加到scene场景中
    // 设置用于计算阴影的光源对象
    spotLight.castShadow = true;
    // 设置计算阴影的区域，注意包裹对象的周围
    spotLight.shadow.camera.near = 1;
    spotLight.shadow.camera.far = 300;
    spotLight.shadow.camera.fov = 20;







    //建立三维坐标系
    var axisHelper=new  THREE.AxisHelper(250);
     scene.add(axisHelper);
    geometry();
    renderer.render(scene,camera);

   /* var controls=new THREE.OrbitControls(camera,renderer.domElement);
    controls.addEventListener('change',renderer);*/

    function  triangle(){
        //创建一个Buffer类型几何体对象
        var triangle=new THREE.BufferGeometry();

        var  vertices=new Float32Array([
            0,0,0,    //顶点1坐标
            50,0,0,   //顶点2坐标
            0,100,0,  //顶点3坐标
            0,0,10,//顶点4坐标
            0,0,100,//顶点5坐标
            50,0,10,//顶点6坐标
        ])

        //创建缓冲区对象
        var attribute=new THREE.BufferAttribute(vertices,3);

        //设置集合体attributes属性的位置属性
        triangle.attributes.position=attribute;

        //三角面网格渲染模式
        var material=new THREE.MeshBasicMaterial({
            color:0x0000ff,
            side:THREE.DoubleSide
        })

        //材质对象
        var mesh=new THREE.Mesh(triangle,material);
        scene.add(mesh)
    }

    function  geometry(){
        //长方体
        var geometryLong=new THREE.BoxGeometry(100,100,100);
        var material=new THREE.MeshLambertMaterial({
            color:0x0000ff
        });
        //创建网格模型对象mesh
        var mesh1=new THREE.Mesh(geometryLong,material);
        //scene.add(mesh1)

        //创建球体网状模型
        var box=new  THREE.SphereGeometry(100,50,50);
        var meterial2=new THREE.MeshBasicMaterial({
            color:0xff00ff,

        })
        //点材质
        var point = new THREE.Line(box, meterial2);
        //var mesh2=new THREE.Mesh(box,meterial2);
        point.computeLineDistances();
        scene.add(point);

        //圆柱
        var cylinder=new THREE.CylinderGeometry(50,50,100,25);
        var material3=new  THREE.MeshLambertMaterial({
            color:0xffff00,
            specular:0x4488ee,
            shininess:!2
        })
        var mesh3=new THREE.Mesh(cylinder,material3)
        //scene.add(mesh3)
        //正八面体
        var octahedronGeometry=new THREE.OctahedronGeometry(50);
        //正十二面体
        var dodecahedronGeometry=new THREE.DodecahedronGeometry(50);
        //正二十面体
        var icosahedronGeometry=new THREE.IcosahedronGeometry(50)

    }

    function points(){
        //点模型
        //创建一个Buffer类型几何体对象
        var triangle=new THREE.BufferGeometry();

        var  vertices=new Float32Array([
            0,0,0,    //顶点1坐标
            50,0,0,   //顶点2坐标
            0,100,0,  //顶点3坐标
            0,0,10,//顶点4坐标
            0,0,100,//顶点5坐标
            50,0,10,//顶点6坐标
        ])

        //创建缓冲区对象
        var attribute=new THREE.BufferAttribute(vertices,3);

        //设置集合体attributes属性的位置属性
        triangle.attributes.position=attribute;

        //类型数组创建顶点颜色color数据
        var  colors=new Float32Array([
            1,0,0,  //顶点1颜色
            0,1,0,//顶点2颜色
            0,0,1,//顶点3颜色

            1,1,0,  //顶点4颜色
            0,1,1,//顶点5颜色
            1,0,1,  //顶点6颜色
        ])
        //设置集合体attribues属性的颜色color属性
        triangle.attributes.color=new THREE.BufferAttribute(colors,3);

        var material=new THREE.PointsMaterial({
            size:10.0,
            vertexColors:THREE.VertexColors,//以顶点颜色为准
        })
        var points=new  THREE.Points(triangle,material);
        scene.add(points)
    }

    function lines(){
        //点模型
        //创建一个Buffer类型几何体对象
        var triangle=new THREE.BufferGeometry();

        var  vertices=new Float32Array([
            0,0,0,    //顶点1坐标
            50,0,0,   //顶点2坐标
            0,100,0,  //顶点3坐标
            0,0,10,//顶点4坐标
            0,0,100,//顶点5坐标
            50,0,10,//顶点6坐标
        ])

        //创建缓冲区对象
        var attribute=new THREE.BufferAttribute(vertices,3);

        //设置集合体attributes属性的位置属性
        triangle.attributes.position=attribute;

        var material=new THREE.LineBasicMaterial({
            color:0xff0000
        })
        var line=new  THREE.Line(triangle,material);
        scene.add(line)
    }
    function triangle(){
        var geometry=new THREE.BufferGeometry();
        //类型数组创建顶点点位
        var vertices=new Float32Array([
            0,0,0,   //顶点1坐标
            50,0,0,  //顶底啊2坐标
            0,100,0, //顶点3坐标

            0,0,0,   //顶点4坐标
            0,0,100,  //顶点 5坐标
            50,0,0,    //顶点6坐标
        ]);

        //创建属性缓冲区
        var attribute=new THREE.BufferAttribute(vertices,3);
        geometry.attributes.position=attribute;


        //定义顶点法向量数据
        var normals = new Float32Array([
            0, 0, 1, //顶点1法向量
            0, 0, 1, //顶点2法向量
            0, 0, 1, //顶点3法向量

            0, 1, 0, //顶点4法向量
            0, 1, 0, //顶点5法向量
            0, 1, 0, //顶点6法向量
        ]);
// 设置几何体attributes属性的位置normal属性
        geometry.attributes.normal = new THREE.BufferAttribute(normals, 3);

        var material=new THREE.MeshBasicMaterial({
            color:0x0000ff,
            side: THREE.DoubleSide
        })

        var mesh=new THREE.Mesh(geometry,material);
        scene.add(mesh);
    }

    function  triangleIndex(){
        var geometry=new THREE.BufferGeometry();
        var  vertices=new Float32Array([
            0,0,0,  //顶点1坐标
            80,0,0, //顶点2坐标
            80,80,0,//顶点3坐标
            0,80,0,     //顶点4坐标
        ])

        //创建缓冲区
        geometry.attributes.position=new THREE.BufferAttribute(vertices,3);

        //设置顶点法向量
        var normal=new Float32Array([
            0,0,1,  //顶点1法向量
            0,0,1,  //顶点2法向量
            0,0,1,  //顶点3法向量

            0,0,1,  //顶点4法向量

        ])
        geometry.attributes.normal=new THREE.BufferAttribute(normal,3);


        //Uint16Array 数组创建顶点索引数据
        var indexs=new Uint16Array([
            //0 对应第一个顶点位置数据，第一个顶点法向量数据
            //1，对象第二个顶点位置数据，第2个顶点法向量数据
            //索引值3个为一组，表示一个三角形的3个顶点
            0,1,2,
            0,2,3
        ])
        geometry.index=new THREE.BufferAttribute(indexs,1)



        var material=new THREE.MeshBasicMaterial({
            color:0xffff00
        })
        var mesh=new THREE.Mesh(geometry,material)

        scene.add(mesh);
    }

    function  vector(){
        var geometry=new THREE.Geometry();




        var p1=new THREE.Vector3(0,0,0);  //顶点1坐标
        var p2=new THREE.Vector3(0,100,0); //顶点2坐标
        var p3=new THREE.Vector3(50,0,0); //顶点3坐标
        var p4=new THREE.Vector3(0,0,100);//顶点4坐标


        //顶点坐标添加到geometry
        geometry.vertices.push(p1,p2,p3,p4);

        //Face3走早函数创建一个三角面
        var face1=new THREE.Face3(0,1,2);
        //三角面每个顶点的法向量
        var n1=new THREE.Vector3(0,0,-1); //三角面Face1顶点1的法向量
        var n2=new THREE.Vector3(0,0,-1); //三角面2face2顶点2的法向量
        var n3=new THREE.Vector3(0,0,-1);//三角面3Faces3顶点3的法向量
        face1.vertexNormals.push(n1,n2,n3);

        //三角面2
        var face2=new THREE.Face3(0,2,3);
        //设置三角面法向量
        face2.normal=new THREE.Vector3(0,-1,0);

        //三角面face1，face2添加到几何体中
        geometry.faces.push(face1,face2);

        //Color对象表示顶点颜色数据
        var color1=new THREE.Color(0x00ff00);  //顶点1颜色 --绿色
        var color2=new THREE.Color(0xff0000);   //顶点2颜色--红色
        var color3=new THREE.Color(0x0000ff);   //顶点3颜色--蓝色
        //顶点颜色数据添加到geometry对象
        geometry.colors.push(color1,color2,color3)


        //几何体xyz三个方向都放大2倍
        geometry.scale(2,2,2)
        //几何体沿x轴平移50
        geometry.translate(50,0,0);
        //几何体绕x旋转45度
        geometry.rotateX(Math.PI/4);
        //居中
        geometry.center();



        var material=new THREE.MeshLambertMaterial({
           vertexColors: THREE.VertexColors,
            side:THREE.DoubleSide
        })
        var mesh=new THREE.Mesh(geometry,material)

        scene.add(mesh);
    }
    function  ParallelLight(){
        //平行光

        var geometry=new THREE.BoxGeometry(40,100,40);

        var material=new  THREE.MeshLambertMaterial({
            color:0x0000ff
        })
        var mesh=new THREE.Mesh(geometry,material);
        scene.addLevel(mesh);
        //设置产生投影的网格模型
        mesh.castShadow=true;

        //创建一个平面几何体作为投影面
        var planeGrometry=new THREE.PlaneGeometry(300,200);
        var planeMarerial=new THREE.MeshLambertMaterial({
            color:0x999999
        })
        //平面网格模型作为投影面
        var planeMesh=new THREE.Mesh(planeGrometry,planeMarerial);
        scene.add(planeMesh);//网格模型添加到场景中
        planeMesh.rotateX(-Math.PI/2);  //旋转网格模型
        planeMesh.position.y=-50; //设置网格模型y坐标
        //设置接受阴影的投影面
        planeMesh.receiveShadow=true;


        //方向光
        var directionalLight=new THREE.DirectionalLight(0xffffff,1)
        //设置光源位置
        directionalLight.position.set(60,100,40);
        scene.add(directionalLight)

        //设置用于计算阴影给的光源对象
        //设置计算阴影的区域，最好刚好紧密包围在对象周围
        //计算阴影的区域过大模糊过小：卡绑定
        directionalLight.shadow.camera.near=0.5;
        directionalLight.shadow.camera.far=300;
        directionalLight.shadow.camera.left=-50;
        directionalLight.shadow.camera.right=50;
        directionalLight.shadow.camera.top=200;
        directionalLight.shadow.camera.bottom=-100;

        //设置mapsize属性可以是阴影更清晰，不那么模糊
        //directionLight.shadow.mapSize.set(1024,1024)
        console.log(directionalLight.shadow.camera);
    }
</script>
</body>
</html>
