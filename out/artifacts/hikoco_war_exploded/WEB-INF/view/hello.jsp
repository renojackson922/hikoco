<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>Hello</title>
</head>
<body>
    인사말: ${greeting}
    배열: ${select}

    <c:forEach items="${test}" var="map">
        ${map.mem_userid}
    </c:forEach>
</body>
</html>
