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

    var viewer=new Cesium.Viewer('cesiumContainer',{
    })

    var  redPolygon=viewer.entities.add({
        name:"Red polygon on surface",
        polygon:{
            hierarchy:Cesium.Cartesian3.fromDegreesArray([
                -115.0,
                37.0,
                -115.0,
                32.0,
                -107.0,
                33.0,
                -102.0,
                31.0,
                -102.0,
                35.0
            ]),
            material:Cesium.Color.RED
        }
    })

    var  greenPolygon=viewer.entities.add({
        name:"green  polgon on surface",
        polygon:{
            hierarchy:Cesium.Cartesian3.fromDegreesArray([
                -108,42.0,-100,42.0,-104.0,40.0
                ]),
            extrudedHeight:500000.0,
            material:Cesium.Color.GREEN,
            closeTop:false,
            closeBottom:false,

        }
    })

    var orangePolygon=viewer.entities.add({
        name:"Orange polygon with per-position heights and ooutline",
        polygon:{
            hierarchy:Cesium.Cartesian3.fromDegreesArrayHeights([
                -108.0,25.0,100000,
                -100.0,25.0,100000,
                -100.0,30.0,100000,
                -108.0,30.0,300000,
            ]),
            extrudedHeight:0,
            perPositionHeight:true,
            material:Cesium.Color.ORANGE.withAlpha(0.5),
            outline:true,
            outlineColor:Cesium.Color.BLACK,
        }
    })




    viewer.zoomTo(viewer.entities);

</script>

</body>
</html>
