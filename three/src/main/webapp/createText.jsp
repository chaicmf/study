<%--
  Created by IntelliJ IDEA.
  User: 15313
  Date: 2020/8/3
  Time: 17:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>creating text</title>
    <STYLE>
        #info{
            position: absolute;
            top: 10px;
            width: 100%;
            text-align: center;
            z-index: 100;
            display: block;
        }
    </STYLE>
</head>
<body>
<div id="info">Description</div>
<script src="js/three.js"></script>
<script>
new THREE.TextGeometry("这事一段文字")
</script>

</body>
</html>
