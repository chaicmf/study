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

  /*  viewer.camera.setView({
        //俯视
        destination:Cesium.Cartesian3.fromDegrees(116.39, 39.9, 150.0),
        //平视
        orientation: {
            heading : Cesium.Math.toRadians(90.0), //  角度默认为 0.0,
            pitch : Cesium.Math.toRadians(0),    //
            roll : 0.0                             // default value
        }
    })*/
     viewer.camera.setView({
          //俯视
          destination:  new Cesium.Cartesian3(1214162.2928122322,-4943078.11574258,3872962.087445102),
          //平视
          orientation: {
              heading : 0.4296532802607489, //  角度默认为 0.0,
              pitch :-0.6123385516550335,    //
              roll : 0.0                             // default value
          }
      })




</script>

</body>
</html>
