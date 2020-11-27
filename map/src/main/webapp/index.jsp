<html>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=7wzjGvlcwqcbadATDjFcekDNmSKYX2QX"></script>
<script type="text/javascript" src="http://api.map.baidu.com/library/LuShu/1.2/src/LuShu_min.js"></script>
<style type="text/css">

    html{
        height:100%
    }
    body{
        height:100%;
        margin:0px;
        padding:0px
    }
    #map{
        height:100%
    }
</style>

<body>
<div id="map"></div>
<script type="text/javascript">
    //创建地图实例
    var map = new BMap.Map("map");
    //创建中心点坐标
    var point = new BMap.Point(116.43,23.43);
    //设置地图中心点坐标并设置缩放级别
    map.centerAndZoom(point, 10)
    //创建坐标点数组
    var points = [
        new BMap.Point(117.270591,23.812975),
        new BMap.Point(117.227819,23.814327),
        new BMap.Point(117.171452,23.800036),
        new BMap.Point(117.132368,23.791609),
        new BMap.Point(117.076919,23.764658),
        new BMap.Point(117.024827,23.754510),
        new BMap.Point(116.981047,23.739533),
        new BMap.Point(116.939091,23.717617),
        new BMap.Point(116.900199,23.699399),
        new BMap.Point(116.885031,23.689196),
        new BMap.Point(116.874584,23.679668),
        new BMap.Point(116.811841,23.626940),
        new BMap.Point(116.759632,23.604713),
        new BMap.Point(116.725061,23.587160),
        new BMap.Point(116.651402,23.566650),
        new BMap.Point(116.595323,23.545934),
        new BMap.Point(116.565463,23.533553),
        new BMap.Point(116.552337,23.519046),
        new BMap.Point(116.544596,23.508704),
        new BMap.Point(116.537630,23.464337),
        new BMap.Point(116.528264,23.443634),
        new BMap.Point(116.518571,23.425543),
        new BMap.Point(116.502256,23.414608),
        new BMap.Point(116.429954,23.388459),
        new BMap.Point(116.388039,23.368854),
        new BMap.Point(116.352537,23.347284),
        new BMap.Point(116.281605,23.327247),
        new BMap.Point(116.227800,23.293717),
        new BMap.Point(116.214108,23.280499),
        new BMap.Point(116.180527,23.247139),
        new BMap.Point(116.107918,23.134458),
        new BMap.Point(116.040802,23.102683),
        new BMap.Point(116.005375,23.071510),
        new BMap.Point(115.979189,23.052335),
        new BMap.Point(115.874687,23.017842),
        new BMap.Point(115.732058,22.949055),
        new BMap.Point(115.650940,22.903134),
        new BMap.Point(115.559445,22.859811), ];
    //地点
    var icon2 = new BMap.Icon('http://lbsyun.baidu.com/jsdemo/img/car.png', new BMap.Size(30, 30), {anchor: new BMap.Size(15, 15)});
    //创建路线轨迹
    var polyline = new BMap.Polyline(points);
    //将路线添加到地图上
    map.addOverlay(polyline);
    //创建路书
    var lushu = new BMapLib.LuShu(map, points, {
        defaultContent: '车车车',//覆盖物内容，这个填上面的特殊点文字才会显示
        speed: 20000,//路书速度
        icon: icon2,//覆盖物图标，默认是百度的红色地点标注
        autoView: false,//自动调整路线视野
        enableRotation: false,//覆盖物随路线走向
    });

    //添加点击事件
    map.addEventListener("click",startlushu);

    //启动路书
    function startlushu(){
        lushu.start();
    }
</script>
</body>
</html>
