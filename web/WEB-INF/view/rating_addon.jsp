<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div>
    <%--<c:choose>--%>
        <%--<c:when test="${satisfy eq 0.0}">--%>
            <%--<span><i class="far fa-star"></i></span>--%>
            <%--<span><i class="far fa-star"></i></span>--%>
            <%--<span><i class="far fa-star"></i></span>--%>
            <%--<span><i class="far fa-star"></i></span>--%>
            <%--<span><i class="far fa-star"></i></span>--%>
        <%--</c:when>--%>
        <%--<c:when test="${satisfy > 0 && satisfy <= 0.5}">--%>
            <%--<span><i class="fas fa-star-half-alt"></i></span>--%>
            <%--<span><i class="far fa-star"></i></span>--%>
            <%--<span><i class="far fa-star"></i></span>--%>
            <%--<span><i class="far fa-star"></i></span>--%>
            <%--<span><i class="far fa-star"></i></span>--%>
        <%--</c:when>--%>
        <%--<c:when test="${satisfy eq 1.0}">--%>
            <%--<span><i class="fas fa-star"></i></span>--%>
            <%--<span><i class="far fa-star"></i></span>--%>
            <%--<span><i class="far fa-star"></i></span>--%>
            <%--<span><i class="far fa-star"></i></span>--%>
            <%--<span><i class="far fa-star"></i></span>--%>
        <%--</c:when>--%>
        <%--<c:when test="${satisfy > 1.0 && satisfy <= 1.5}">--%>
            <%--<span><i class="fas fa-star"></i></span>--%>
            <%--<span><i class="fas fa-star-half-alt"></i></span>--%>
            <%--<span><i class="far fa-star"></i></span>--%>
            <%--<span><i class="far fa-star"></i></span>--%>
            <%--<span><i class="far fa-star"></i></span>--%>
        <%--</c:when>--%>
        <%--<c:when test="${satisfy eq 2.0}">--%>
            <%--<span><i class="fas fa-star"></i></span>--%>
            <%--<span><i class="fas fa-star"></i></span>--%>
            <%--<span><i class="far fa-star"></i></span>--%>
            <%--<span><i class="far fa-star"></i></span>--%>
            <%--<span><i class="far fa-star"></i></span>--%>
        <%--</c:when>--%>
    <%--</c:choose>--%>
    <%--<span><i class="fas fa-star"></i></span>--%>
    <%--<span><i class="fas fa-star"></i></span>--%>
    <%--<span><i class="fas fa-star"></i></span>--%>
    <%--<span><i class="far fa-star"></i></span>--%>
    <%--<span><i class="far fa-star"></i></span>--%>
    <c:set var="satisfyNatural" value="${satisfy - (satisfy%1)}"/>
    <c:set var="satisfySod" value="${satisfy % 1}"/>
</div>
</body>
</html>
