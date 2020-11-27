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

    //Make sure viewer is at the desired time.
    var start = Cesium.JulianDate.fromDate(new Date(2018, 11, 12, 15));
      var totalSeconds = 10;
      var stop = Cesium.JulianDate.addSeconds(
          start,
          totalSeconds,
          new Cesium.JulianDate()
      );
      viewer.clock.startTime = start.clone();
      viewer.clock.stopTime = stop.clone();
      viewer.clock.currentTime = start.clone();
      viewer.clock.clockRange = Cesium.ClockRange.LOOP_STOP;
      viewer.timeline.zoomTo(start, stop);

      // Create a path for our vehicle by lerping between two positions.
       var position = new Cesium.SampledPositionProperty();
       var startPosition = new Cesium.Cartesian3(
           -2379556.799372,
           -4665528.20503,
           3628013.10659
       );
       var endPosition = new Cesium.Cartesian3(
           -2379556.799372,
           -4665528.20503,
           3628013.10659
       );
       // A velocity vector property will give us the entity's speed and direction at any given time.
      var velocityVectorProperty = new Cesium.VelocityVectorProperty(
          position,
          false
      );
      var velocityVector = new Cesium.Cartesian3();
      // Store the wheel's rotation over time in a SampledProperty.
      var wheelAngleProperty = new Cesium.SampledProperty(Number);
      var wheelAngle = 0;

     var numberOfSamples = 100;
    for (var i = 0; i <= numberOfSamples; ++i) {
        var factor = i / numberOfSamples;
        var time = Cesium.JulianDate.addSeconds(
            start,
            factor * totalSeconds,
            new Cesium.JulianDate()
        );

        // Lerp using a non-linear factor so that the vehicle accelerates.
        var locationFactor = Math.pow(factor, 2);
        var resultCar= new Cesium.Cartesian3();

        var location = Cesium.Cartesian3.lerp(
              startPosition,
              endPosition,
              locationFactor,
              resultCar
          );
         console.log(location);
          position.addSample(time, location);
            // Rotate the wheels based on how fast the vehicle is moving at each timestep.
            velocityVectorProperty.getValue(time, velocityVector);
            var metersPerSecond = Cesium.Cartesian3.magnitude(velocityVector);
            var wheelRadius = 0.52; //in meters.
            var circumference = Math.PI * wheelRadius * 2;
            var rotationsPerSecond = metersPerSecond / circumference;

            wheelAngle +=
                ((Math.PI * 2 * totalSeconds) / numberOfSamples) *
                rotationsPerSecond;
            wheelAngleProperty.addSample(time, wheelAngle);
    }

         function updateSpeedLabel(time, result) {
            velocityVectorProperty.getValue(time, velocityVector);
            var metersPerSecond = Cesium.Cartesian3.magnitude(velocityVector);
            var kmPerHour = Math.round(metersPerSecond * 3.6);

            return kmPerHour + " km/hr";
        }

        var rotationProperty = new Cesium.CallbackProperty(function (
            time,
            result
            ) {
                return Cesium.Quaternion.fromAxisAngle(
                    Cesium.Cartesian3.UNIT_X,
                    wheelAngleProperty.getValue(time),
                    result
                );
            },
            false);

        var wheelTransformation = new Cesium.NodeTransformationProperty({
            rotation: rotationProperty,
        });

        var nodeTransformations = {
            Wheels: wheelTransformation,
            Wheels_mid: wheelTransformation,
            Wheels_rear: wheelTransformation,
        };

        // Add our vehicle model.
        var vehicleEntity = viewer.entities.add({
            position: position,
            orientation: new Cesium.VelocityOrientationProperty(position), // Automatically set the vehicle's orientation to the direction it's facing.
            model: {
                uri: "",
                runAnimations: false,
                nodeTransformations: nodeTransformations,
            },
            label: {
                text: new Cesium.CallbackProperty(updateSpeedLabel, false),
                font: "20px sans-serif",
                showBackground: true,
                distanceDisplayCondition: new Cesium.DistanceDisplayCondition(
                    0.0,
                    100.0
                ),
                eyeOffset: new Cesium.Cartesian3(0, 3.5, 0),
            },
        });
        viewer.trackedEntity = vehicleEntity;
        vehicleEntity.viewFrom = new Cesium.Cartesian3(-10.0, 7.0, 4.0);

</script>

</body>
</html>
