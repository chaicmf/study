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
    var city=viewer.scene.primitives.add(
        new Cesium.Cesium3DTileset({
           url:Cesium.IonResource.fromAssetId(75343)
        })
    )
    city.style = new Cesium.Cesium3DTileStyle({
        color : {
            conditions : [
                ['${Height} >= 100', 'color("purple", 0.5)'],
                ['${Height} >= 50', 'color("red")'],
                ['true', 'color("blue")']
            ]
        },
        show : '${Height} > 0',
        meta : {
            description : '"Building id ${id} has height ${Height}."'
        }
    });
    viewer.zoomTo(city)


</script>

</body>
</html>
