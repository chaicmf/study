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
    //加载json文件
    var neighood=Cesium.GeoJsonDataSource.load("https://geo.datav.aliyun.com/areas_v2/bound/511000_full.json")
    neighood.then(function(dataSource){
        viewer.dataSources.add(dataSource)
        var entites=dataSource.entities.values;
        var colorHash={};
        for (var i = 0; i < entites.length; i++) {
            var entity=entites[i];

            var name=entity.name;
            var color=colorHash[name];
            //设置颜色
            if(!color){
                color=Cesium.Color.fromRandom({
                    alpha:1.0
                })
                colorHash[name]=color;
            }
            //设置区域颜色
            entity.polygon.material=color;
            //不显示外边界
            entity.polygon.outline=false;
            //设置区域高度
            entity.polygon.extrudedHeight=5000.0;

        }
    })


    viewer.zoomTo(neighood);


    var  handle=new Cesium.ScreenSpaceEventHandler(viewer.scene.canvas)

    var preEntity=undefined;
    handle.setInputAction(function(movement){

       if(Cesium.defined(movement.endPosition)){
           var pickedPrimitive=viewer.scene.pick(movement.endPosition)
           var pickedEntity=(Cesium.defined(pickedPrimitive))?pickedPrimitive.id:undefined;

          var  color=Cesium.Color.fromRandom({
               alpha:1.0
           })
           if(Cesium.defined(preEntity)){
               preEntity.polygon.extrudedHeight=5000.0;
           }
           if(Cesium.defined(pickedEntity.polygon)){
               //修改区域颜色
               pickedEntity.polygon.material=color;
               pickedEntity.polygon.extrudedHeight=10000.0;
               preEntity=pickedEntity
           }

       }

    },Cesium.ScreenSpaceEventType.MOUSE_MOVE)



</script>

</body>
</html>
