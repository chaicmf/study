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

    var  redLine=viewer.entities.add({
            polyline:{
                positions: Cesium.Cartesian3.fromDegreesArray([-75, 35, -125, 35]),
                show:true,
                width:5,
                loop:true,
                material: Cesium.Color.RED,
                clampToGround:true
            }
        })
var   greenThumbLine=viewer.entities.add({
        name:"Green rhum line",
        polyline:{
            positions:Cesium.Cartesian3.fromDegreesArray([
               -75,35,-125,35
            ]),
            width:5,
            arcType:Cesium.ArcType.RHUMB,
            material:Cesium.Color.GREEN,
        }
})
  var  glowingLine=viewer.entities.add({
      name:"Glowing blue line on the surface",
      polyline:{
          positions:Cesium.Cartesian3.fromDegreesArray([
              -75.0,37,-125,37
          ]),
          width:10,
          material:new Cesium.PolylineGlowMaterialProperty({
              glowPower:0.2,
              taperPower:0.5,
              color:Cesium.Color.CORNFLOWERBLUE
          })
      }
  })

    var  orangeOutLined=viewer.entities.add({
        name:"orange line with back outline at height",
        polyline:{
            positions:Cesium.Cartesian3.fromDegreesArrayHeights([
                -79,39,250000,
                -125,39,250000
            ]),
            width:10,
            material:new Cesium.PolylineOutlineMaterialProperty({
                color:Cesium.Color.ORANGE,
                outlineWidth:2,
                outlineColor:Cesium.Color.BLACK
            })
        }
    })

    var purpleArrow=viewer.entities.add({
        name:"Purple straight arrow at height",
        polyline:{
            positions:Cesium.Cartesian3.fromDegreesArrayHeights([
                -75,43,500000,
                -125,43,500000,
            ]),
            width:10,
            arcType:Cesium.ArcType.NONE,
            material:new Cesium.PolylineArrowMaterialProperty(
                Cesium.Color.PURPLE
            ),
        }
    })


    var dashedLine=viewer.entities.add({
        name:"Blue dashed line",
        polyline:{
            positions:Cesium.Cartesian3.fromDegreesArrayHeights([
                -75,45,500000,-125,45,500000,
            ]),
            width:4,
            material:new Cesium.PolylineDashMaterialProperty({
                color:Cesium.Color.CYAN
            })
        }
    })


    viewer.zoomTo(viewer.entities);

</script>

</body>
</html>
