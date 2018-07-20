<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--<img alt="" src="/getByteImage" width="30%" />--%>
<c:forEach var="i" begin="1" end="2" step="1">
<img alt="" src="/imageDisplay?id=${i}" width="30%" />
</c:forEach>
</body>
</html>
