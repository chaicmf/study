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
<div id="cesiumContainer"></div>
<script>
    Cesium.Ion.defaultAccessToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiJlNGQ5NWY2My02NWVhLTQ3OTItODFmZi1hZTg3MmM2YTBkYjgiLCJpZCI6MzQ5ODAsImlhdCI6MTYwMTE2NzE4OX0.Unbpzbp_chYaMtVtCaNxevkfDlMSERbjNUP40jtbs5Y';
    var viewer=new Cesium.Viewer('cesiumContainer',{
    })


    //配置scene  开启太阳位置的光照  光照会随着每天的时间来变化

    viewer.scene.globe.enableLighting = true;

    var initialPosition = new Cesium.Cartesian3.fromDegrees(-73.998114468289017509, 40.674512895646692812, 2631.082799425431);

    var initialOrientation = new Cesium.HeadingPitchRoll.fromDegrees(7.1077496389876024807, -31.987223091598949054, 0.025883251314954971306);
    var homeCameraView = {
        destination : initialPosition,
        orientation : {
            heading : initialOrientation.heading,
            pitch : initialOrientation.pitch,
            roll : initialOrientation.roll
        }
    };
    viewer.scene.camera.setView(homeCameraView);


    //重写home按钮

    homeCameraView.duration=2.0;
    homeCameraView.maximumHeight=2000;
    homeCameraView.pitchAdjustHeight=2000;
    homeCameraView.endTransform=Cesium.Matrix4.IDENTITY;

    viewer.homeButton.viewModel.command.beforeExecute.addEventListener(function(e){
        console.log(e)
        e.cance=true;
        viewer.scene.camera.flyTo(homeCameraView)
    })

    viewer.clock.shouldAnimate = true; // make the animation play when the viewer starts
    viewer.clock.startTime = Cesium.JulianDate.fromIso8601("2017-07-11T16:00:00Z");
    viewer.clock.stopTime = Cesium.JulianDate.fromIso8601("2017-07-11T16:20:00Z");
    viewer.clock.currentTime = Cesium.JulianDate.fromIso8601("2017-07-11T16:00:00Z");
    viewer.clock.multiplier = 2; // sets a speedup
    viewer.clock.clockStep = Cesium.ClockStep.SYSTEM_CLOCK_MULTIPLIER; // tick computation mode
    viewer.clock.clockRange = Cesium.ClockRange.LOOP_STOP; // loop at the end
    viewer.timeline.zoomTo(viewer.clock.startTime, viewer.clock.stopTime); // set visible range


</script>

</body>
</html>
