
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
    camera.position.set(200,300,200);
    camera.lookAt(scene.position)

    //渲染器
    var renderer=new THREE.WebGLRenderer();
    renderer.setSize(window.innerWidth,window.innerHeight);
    document.body.appendChild(renderer.domElement);

    //创建两个网格模型mesh1、mesh2
   /* var geometryLong=new THREE.BoxGeometry(150,100,100);
    var material=new THREE.MeshBasicMaterial({
        color:0x0000ff
    });
    //创建网格模型对象mesh
    var group = new THREE.Group();
    var mesh1 = new THREE.Mesh(geometryLong, material);
    var mesh2 = new THREE.Mesh(geometryLong, material);
    mesh1.name="眼睛"
    group.name="头"

    mesh2.translateX(25);
    //把mesh1型插入到组group中，mesh1作为group的子对象
    group.add(mesh1);
    //把mesh2型插入到组group中，mesh2作为group的子对象
    group.add(mesh2);
    //把group插入到场景中作为场景子对象
    scene.add(group);
    group.translateY(100)*/


    //头部网格模型和组
    var  headMesh=sphereMesh(10,0,0,0)
        headMesh.name="脑壳";
    var leftEyeMesh=sphereMesh(1,8,5,4);
        leftEyeMesh.name="左眼";
    var rightEyeMesh=sphereMesh(1,8,5,-4);
        rightEyeMesh.name="右眼";
    var headGroup=new THREE.Group();
        headGroup.name="头部"
    headGroup.add(headMesh,leftEyeMesh,rightEyeMesh);

    //身体网格模型和组
        var neckMesh=cylinderMesh(3,10,0,-15,0);
            neckMesh.name="脖子";
        var bodyMesh=cylinderMesh(14,30,0,-35,0);
            bodyMesh.name="腹部";
        var leftLegMEsh=cylinderMesh(4,60,0,-80,-7);
            leftLegMEsh.name="左腿"
        var rightLegMesh=cylinderMesh(4,60,0,-80,7);
            rightLegMesh="右腿";
        var legGroup=new THREE.Group();
            legGroup.name="腿";
        legGroup.add(leftLegMEsh,rightLegMesh);
        var bodyGroup=new THREE.Group();
            bodyGroup.name="身体";
         bodyGroup.add(neckMesh,bodyMesh,legGroup);
         //人Group
        var personGroup=new THREE.Group();
            personGroup.name="人";
            personGroup.add(headGroup,bodyGroup);
    personGroup.translateY(50)
    scene.add(personGroup)

    scene.traverse(function(obj){
        if(obj.type==="Group"){
            console.log(obj.name);
        }
        if(obj.type==="Mesh"){
            console.log("Mesh:"+obj.name);
        }
        if(obj.name==="右腿"){
            obj.material.color.set(0x000000);
        }
        //打印id属性
        console.log(obj.id);
        //打印该对象的父对象
        console.log("parent"+obj.parent);
        //打印该对象的子对象
        console.log("children"+obj.children)
    })
    var nameNode=scene.getObjectByName("脑壳");
    nameNode.material.color.set(0xff0000)















    //建立三维坐标系
    var axisHelper=new  THREE.AxisHelper(250);
    scene.add(axisHelper);
     renderer.render(scene,camera);
     //球体网格模型创建函数
    function sphereMesh(R,x,y,z){
        //球形几何体
        var geometry=new THREE.SphereGeometry(R,50,50);
        var material=new THREE.MeshBasicMaterial({
            color:0x0000ff
        }) //材质对象Material
        //创建网格模型对象
        var mesh=new THREE.Mesh(geometry,material);
        mesh.position.set(x,y,z);
        return mesh;

    }
    //圆柱体网格模型创建函数
    function cylinderMesh(R,h,x,y,z){
        var geometry=new THREE.CylinderGeometry(R,R,h,50,50);
        var material=new THREE.MeshBasicMaterial({
            color:0x0000ff
        })

        var mesh=new THREE.Mesh(geometry,material);
        mesh.position.set(x,y,z)
        return mesh;

    }


</script>
</body>
</html>
