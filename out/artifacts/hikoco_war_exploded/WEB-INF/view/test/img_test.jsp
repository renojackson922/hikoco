<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="/shop/img" enctype="multipart/form-data" method="post">
        <input type="file" name="imgFile" />
        <input type="submit" value="이미지저장"/>
    </form>
    <a href="/shop/viewImage">저장된 이미지 확인하기</a>
</body>
</html>
