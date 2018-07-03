    <%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <%
            System.out.println("현재 접속중인 세션ID: " + session.getAttribute("userid"));
        %>
        <style>
        #hikoco-nav{
        padding: 8px 36px 8px 36px;
        height: 56px;
        }
        nav{
        /* Highest z-index value */
        z-index: 2147483646 !important;
        }
        </style>
        <nav id="hikoco-nav" class="navbar navbar-expand-lg navbar-dark" style="position:fixed; width:100%;">
        <!--navbar-dark-->
        <a class="navbar-brand" href="/"><i class="fas fa-coffee"></i>&nbsp;&nbsp;Cafe HIKOCO</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
        <a class="nav-link" href="/">Home <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
        <a class="nav-link" href="/item.do?mode=list"><i class="fas fa-gift"></i>&nbsp;Item</a>
        </li>
        <li class="nav-item">
        <a class="nav-link" href="/item_test.do"><i class="fas fa-gift"></i>&nbsp;Item_TEST</a>
        </li>
        <li class="nav-item dropdown">
        <%--<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">--%>
        <%--Dropdown--%>
        <%--</a>--%>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
        <%--<a class="dropdown-item" href="#">Action</a>--%>
        <%--<a class="dropdown-item" href="#">Another action</a>--%>
        <div class="dropdown-divider"></div>
        <%--<a class="dropdown-item" href="#">Something else here</a>--%>
        </div>
        </li>
        <li class="nav-item">
        <%--<a class="nav-link disabled" href="#">Disabled</a>--%>
        </li>
        </ul>
        <!-- Another nav -->
        <ul class="navbar-nav mr-2">
        <c:choose>
            <c:when test="${sessionScope.userid eq null}">
                <li class="nav-item">
                <a class="nav-link" href="#" ng-click="lockBodyScroll={overflow:'hidden'}; hideAndSeek();">Sign in</a>
                </li>
                <li class="nav-item">
                <a class="nav-link" href="/mycart.do">My Cart</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="nav-item">
                <a class="nav-link" href="#">${sessionScope.nickname} 님, 환영합니다.</a>
                </li>
                <li class="nav-item">
                <a class="nav-link" href="<c:url value="/logout.do"/>">Logout</a>
                </li>
                <li class="nav-item">
                <a class="nav-link" href="/mycart.do">My Cart</a>
                </li>
            </c:otherwise>
        </c:choose>
        </ul>
        <style>
        .btn-outline-purple {
        color: blueviolet;
        background-color: transparent;
        background-image: none;
        border-color: blueviolet;
        }
        .btn-outline-purple:hover {
        color: #212529;
        background-color: blueviolet;
        border-color: blueviolet;
        }

        .btn-outline-purple.focus,.btn-outline-purple:focus {
        box-shadow: 0 0 0 .2rem rgba(136,112,162,0.69);
        }

        .btn-outline-purple.disabled,.btn-outline-purple:disabled {
        color: blueviolet;
        background-color: transparent;
        }

        .btn-outline-purple:not(:disabled):not(.disabled).active,.btn-outline-purple:not(:disabled):not(.disabled):active,.show>.btn-outline-purple.dropdown-toggle
        {
        color: #212529;
        background-color: blueviolet;
        border-color: blueviolet;
        }

        .btn-outline-purple:not(:disabled):not(.disabled).active:focus,.btn-outline-purple:not(:disabled):not(.disabled):active:focus,.show>.btn-outline-purple.dropdown-toggle:focus
        {
        box-shadow: 0 0 0 .2rem rgba(136,112,162,0.69);
        }
        </style>
        <form class="form-inline my-2 my-lg-0" action="/item.do" method="GET">
        <input type="hidden" name="mode" value="search">
        <input class="form-control mr-sm-2" type="search" placeholder="상품명 검색" aria-label="Search" name="search_string">
        <button class="btn btn-outline-purple my-2 my-sm-0" type="submit">검색</button>
        </form>
        </div>
        </nav>
