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


    var entity = viewer.entities.add({
        position: Cesium.Cartesian3.fromDegrees(120.9677706,30.7985748,2.61),
        point: {
            color: Cesium.Color.RED,    //点位颜色
            pixelSize: 10                //像素点大小
        },
        label : {
            text : '测试名称',
            font : '14pt Source Han Sans CN',    //字体样式
            fillColor:Cesium.Color.BLACK,        //字体颜色
            backgroundColor:Cesium.Color.AQUA,    //背景颜色
            showBackground:true,                //是否显示背景颜色
            style: Cesium.LabelStyle.FILL,        //label样式
            outlineWidth : 2,
            verticalOrigin : Cesium.VerticalOrigin.CENTER,//垂直位置
            horizontalOrigin :Cesium.HorizontalOrigin.LEFT,//水平位置
            pixelOffset:new Cesium.Cartesian2(10,0)            //偏移
        }
    });
    viewer.zoomTo(entity);

</script>

</body>
</html>
