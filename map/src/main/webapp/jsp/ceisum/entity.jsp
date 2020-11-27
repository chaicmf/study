<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="./../../js/cesium/Widgets/widgets.css" rel="stylesheet">
    <script type="text/javascript" src="./../../js/cesium/Cesium.js"></script>
    <script type="text/javascript" src="./../../js/jquery.min.js"></script>
    <style>
        html body{
            width: 100%;
            height: 100%;
        }
        #cesiumContainer{
            width: 100%;
            height: 100%;
        }
    </style>
</head>
<body>

<div id="cesiumContainer">

</div>
<script>

    Cesium.Ion.defaultAccessToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiJlNGQ5NWY2My02NWVhLTQ3OTItODFmZi1hZTg3MmM2YTBkYjgiLCJpZCI6MzQ5ODAsImlhdCI6MTYwMTE2NzE4OX0.Unbpzbp_chYaMtVtCaNxevkfDlMSERbjNUP40jtbs5Y';

    var viewer=new Cesium.Viewer('cesiumContainer')

    var wyoming=viewer.entities.add({
        name:"Wyoming",
        polygon:{
            hierarchy:Cesium.Cartesian3.fromDegreesArray([
                -109.080842,45.002073,
                -105.91517,45.002073,
                -104.058488,44.996596,
                -104.053011,43.002989,
                -104.053011,41.003906,
                -105.728954,40.998429,
                -107.919731,41.003906,
                -109.04798,40.998429,
                -111.047063,40.998429,
                -111.047063,42.000709,
                -111.047063,44.476286,
                -111.05254,45.002073
            ]),
          height:250000,
          material:Cesium.Color.RED.withAlpha(0.5),
          outline:true,
          outlineColor:Cesium.Color.BLACK,
        }
    })
        //将形状挤压成物体  设置 extrudedHeight 属性
        wyoming.polygon.height=200000;
        wyoming.polygon.extrudedHeight=250000;

    var  entityBlue=viewer.entities.add({
        position:Cesium.Cartesian3.fromDegrees(-103.0,40.0),
        ellipse:{
            semiMinorAxis:250000.0,
            semiMajorAxis:400000.0,
            material:Cesium.Color.BLUE.withAlpha(0.5),
            material:'',  //可以指定为一个图片
        }
    })
    //指定为棋盘
    var  ellipse=entityBlue.ellipse;
        ellipse.material=new Cesium.CheckerboardMaterialProperty({
            eventColor:Cesium.Color.WHITE,
            oddColor:Cesium.Color.BLACK,
            repeat:new Cesium.Cartesian2(4,4)
        })
    //条纹
    ellipse.material=new Cesium.StripeMaterialProperty({
        eventColor:Cesium.Color.WHITE,
        oddColor:Cesium.Color.BLACK,
        repeat:32
    })
    //网格
    ellipse.material=new Cesium.GridMaterialProperty({
        color:Cesium.Color.YELLOW,
        cellAlpha:0.2,
        lineCount:new Cesium.Cartesian2(8,8),
        lineThickness:new Cesium.Cartesian2(2.0,2.0)
    });
        //轮廓
    ellipse.fill=false;   //不填充
    ellipse.outline=true;
    ellipse.outlineColor=Cesium.Color.YELLOW;
    ellipse.outlineWidth=2.0;


    //折线

    var line=viewer.entities.add({
        polyline:{
            positions:Cesium.Cartesian3.fromDegreesArray([-104,40,-111,40]),
            width:10,
            material:Cesium.Color.RED
        }
    })
    var linePolyline=line.polyline;
    //折线轮廓
        linePolyline.material=new Cesium.PolylineOutlineMaterialProperty({
            color:Cesium.Color.YELLOW,
            outlineWidth:3,
            outlineColor:Cesium.Color.BLACK
        })
    //折线光晕
        linePolyline.material=new Cesium.PolylineGlowMaterialProperty({
            glowPower:0.2,
            color:Cesium.Color.BLUE,
        })




    viewer.zoomTo(viewer.entities)



</script>

</body>
</html>
