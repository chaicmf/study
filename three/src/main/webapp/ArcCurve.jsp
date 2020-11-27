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


    catmullRomCurve3();

    //建立三维坐标系
    var axisHelper=new  THREE.AxisHelper(250);
    scene.add(axisHelper);

    renderer.render(scene,camera);



    function yuanhu(){

        //声明一个几何体对象Geometry
        var  geometry=new THREE.Geometry();

        //创建一个圆  0,0 圆弧坐标原点，100：圆弧半径，0，2*MAth.pI圆弧起始角度
        var arc=new THREE.ArcCurve(0,0,100,0,2*Math.PI);

        //getPoints是基类Curve得方法，返回一个vector2对象作为元素组曾得数据
        var points=arc.getPoints(50); //分段数50，返回51个顶点

        //setFromPoints方法从points中提取数据改变几何体得顶死按属性vertices
        geometry.setFromPoints(points);


        var material=new THREE.LineBasicMaterial({
            color:0x0000ff
            //vertexColors:THREE.FaceColors
        });
        var  cube=new THREE.Line(geometry,material);
        scene.add(cube);
    }

    function  arcCurve(){
        var geometryArcCurve=new THREE.Geometry();
        var R=100;
        var N=50;
        //批量生成圆弧上得顶点数据
        for(var i=0;i<N;i++){
            var angle=2*Math.PI/N*i;
            var x=R*Math.sin(angle);
            var y=R*Math.cos(angle);
            geometryArcCurve.vertices.push(new THREE.Vector3(x,y,0));
        }
        //Caruso最后一个点，line渲染模式下，产生闭合效果
        //eometry.vertices.push(geometry.vertices[0]);

        //材质对象
        var materialArc=new THREE.LineBasicMaterial({
            color:0xffff00
        })
        //线条模型对象
        var  line=new THREE.Line(geometryArcCurve,materialArc);
        scene.add(line)
    }

    //绘制直线
    function  straightLine(){
        //声明一个几何体对象Geometry
        var geometry=new THREE.Geometry();

        var p1=new THREE.Vector3(50,0,0);//顶点1坐标
        var p2=new THREE.Vector3(0,70,0);//顶点2坐标

        //顶点坐标添加到geometry对象中
        geometry.vertices.push(p1,p2)

        //材质对象
        var material=new THREE.LineBasicMaterial({
            color:0xffff00,
        })

        //线条模型对象
        var line=new THREE.Line(geometry,material);
        scene.add(line);//

    }

    //使用LineCurve3绘制三维直线
    function  lineCurve3(){
        //绘制几何体对象
        var geometry=new THREE.Geometry();

        //声明顶点坐标
        var p1=new THREE.Vector3(50,0,0);
        var p2=new THREE.Vector3(0,70,0);

        //三维直线LineCurve3
        var lineCurve3=new THREE.LineCurve3(p1,p2);

        //二维直线
        var lineCurve3=new THREE.LineCurve(new THREE.Vector2(50,0),new THREE.Vector2(0,70));

        var pointArr=lineCurve3.getPoints(10);

        geometry.setFromPoints(pointArr);
        //材质对象
        var material=new THREE.LineBasicMaterial({
            color:0xffff00,
        })

        //线条模型对象
        var line=new THREE.Line(geometry,material);
        scene.add(line);
    }


    function  catmullRomCurve3(){
        //创建一个几何体对象
        var  geometry=new THREE.Geometry();
        //三维样条曲线 catmull-Rom算法
        var curve=new THREE.CatmullRomCurve3([
            new THREE.Vector3(-50,20,90),
            new THREE.Vector3(-10,40,40),
            new THREE.Vector3(0,0,0),
            new THREE.Vector3(60,-60,0),
            new THREE.Vector3(70,0,80)
        ]);
        //getPoints是基类Curve的方法，返回一个vector3对象作为元素组成的数组
        var points=curve.getPoints(100);
        //setFormPoints方法从points中提取数据改变几何体的顶点属性vertices
        geometry.setFromPoints(points);
        //材质对象
        var material=new THREE.LineBasicMaterial({
            color:0x0000ff
        })

        //线条模型对象
        var line=new THREE.Line(geometry,material);
        scene.add(line)

    }







</script>
</body>
</html>