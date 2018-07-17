<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="org.silkdog.maven.hikoco.category.vo.CategoryVO" %>
<%@ page import="org.silkdog.maven.hikoco.category.dao.CategoryDAO" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    List<HashMap> clist = (List<HashMap>) request.getAttribute("clist");


    /* indent */
//    for(int i = 0; i < clist.size(); i++){
//        CategoryDTO cdto1 = clist.get(i);
//        for(int j = 1; j < clist.size(); j++) {
//            CategoryDTO cdto2 = clist.get(j);
//            if (cdto1.getHic_id() == Integer.parseInt(cdto2.getHic_parent()) && cdto1.getHic_indent() == cdto2.getHic_indent()-1){
//                Collections.swap(clist,j, i+1);
//            }
//
//        }
//     }

//     /* 서순 */
//    for(int i = 0; i < clist.size(); i++){
//        CategoryDTO cdto1 = clist.get(i);
//        for(int j = 1; j < clist.size(); j++) {
//            CategoryDTO cdto2 = clist.get(j);
//            if (!cdto1.getHic_parent().equals("-1") &&
//                    !cdto2.getHic_parent().equals("-1") &&
//                    (Integer.parseInt(cdto1.getHic_parent()) == Integer.parseInt(cdto2.getHic_parent())) &&
//                    (cdto1.getHic_indent() == cdto2.getHic_indent()) &&
//                    (cdto1.getHic_order() == cdto2.getHic_order()) &&
//                    cdto1.getHic_id() < cdto2.getHic_id()){
//                Collections.swap(clist,i,j);
//            }else{
//                continue;
//            }
//        }
//    }


//    for(CategoryDTO cdtoTest2 : clist){
//        if(cdtoTest2.getHic_indent() == 1) {
//            System.out.println(cdtoTest2.getHic_val());
//        }else if(cdtoTest2.getHic_indent() == 2){
//            System.out.println("ㄴ" + cdtoTest2.getHic_val());
//        }else if(cdtoTest2.getHic_indent() == 3){
//            System.out.println("  ㄴ" + cdtoTest2.getHic_val());
//        }else if(cdtoTest2.getHic_indent() == 4){
//            System.out.println("    ㄴ" + cdtoTest2.getHic_val());
//        }
//    }

%>
<html ng-cloak ng-app="app">
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <!-- Bootstrap 4.1.1 & jQuery-Slim -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
          integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
            integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
            crossorigin="anonymous"></script>
    <!-- Angular.js -->
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.10/angular.min.js"></script>
    <!-- Underscore.js -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/underscore.js/1.8.3/underscore.js"></script>

    <script type="text/javascript">
        //underscore.js URL parsing code
        // var _GET = _.object(_.compact(_.map(location.search.slice(1).split('&'), function (item) {
        //     if (item) item = item.split('=');
        //     if (item[1]) item[1] = decodeURIComponent(item[1]);
        //     return item;
        // })));


        var app = angular.module('app', []);

        // 다른 도메인의 소스 불러오기 필터
        app.filter('trustUrl', function ($sce) {
            return function (url) {
                return $sce.trustAsResourceUrl(url);
            }
        });

        app.controller('ctrl', function ($scope, $http) {
            $scope.$watch('catOption', function () {
                if ($scope['catOption'] == null || $scope['catOption'] === '') {
                    $scope.catBtn = true;
                } else {
                    $scope.catBtn = false;
                }
            }, true);

            $scope.catAdd = function () {
                if ($scope['catName'] == null || $scope['catName'] === '') {
                    window.alert('EMPTY');
                    return false;
                }
                document.form1.action = "/category_test.do";
                document.form1.submit();
                return true;
            }

            $scope.catDel = function () {
                return false;
            }

            $scope.loadData = function () {
                $http({
                    url: '../../resources/json/category.json',
                    method: 'POST',
                    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                }).then(function (response) {
                    $scope.data = response.data;
                    console.log($scope.data);
                });
            }

            $scope.loadData();


        });
    </script>
</head>
<style>
    .list-group-item {
        width: 60%;
    }

    .list-group-item:first-child {
        border-top-left-radius: 0px;
        border-top-right-radius: 0px;
    }

    .list-group-item:last-child {
        border-bottom-left-radius: 0px;
        border-bottom-right-radius: 0px;
    }

    .list-group-item {
        height: 24px;
        padding: 0 0 0 7px;
        font-size: 0.8em;
    }
</style>
<body ng-controller="ctrl">
<div class="container">
    <ul class="list-group">
        <c:forEach var="i" items="${cnt}">


        </c:forEach>
        <%
            for (CategoryVO cdto : clist) {
                if (cdto.getHic_indent() == 1) {
        %>
        <li class="list-group-item"><%=cdto.getHic_val()%>
        </li>
        <%
        } else if (cdto.getHic_indent() == 2) {
        %>
        <li class="list-group-item">ㄴ<%=cdto.getHic_val()%>
        </li>
        <%
        } else if (cdto.getHic_indent() == 3) {
        %>
        <li class="list-group-item">&nbsp;&nbsp;&nbsp;ㄴ<%=cdto.getHic_val()%>
        </li>
        <%
        } else if (cdto.getHic_indent() == 4) {
        %>
        <li class="list-group-item">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㄴ<%=cdto.getHic_val()%>
        </li>
        <%
                }
            }
        %>
    </ul>
    <hr>
    <form id="form1" name="form1" method="POST">
        <style>
            .form-group {
                float: left;
            }

            <%--<option value="<%=cdto.getHic_id()%>"><%=cdto.getHic_val()%></option>--%>

        </style>
        <%--<div class="form-group col-md-3">--%>
        <%--<label for="cat_exists">기존 카테고리</label>--%>
        <%--<select ng-model="catOption" class="form-control" id="cat_exists" name="cat_exists">--%>
        <%--<option value="" selected>-- 선택하세요 --</option>--%>
        <%--<%--%>
        <%--for(CategoryDTO cdto : clist){--%>
        <%--if(cdto.getHic_indent() == 1) {--%>
        <%--%>--%>
        <%--<option value="<%=cdto.getHic_id()%>"><%=cdto.getHic_val()%></option>--%>
        <%--<%--%>
        <%--}else if(cdto.getHic_indent() == 2){--%>
        <%--%>--%>
        <%--<option value="<%=cdto.getHic_id()%>">ㄴ<%=cdto.getHic_val()%></option>--%>
        <%--<%--%>
        <%--}else if(cdto.getHic_indent() == 3){--%>
        <%--%>--%>
        <%--<option value="<%=cdto.getHic_id()%>">&nbsp;&nbsp;&nbsp;ㄴ<%=cdto.getHic_val()%></option>--%>
        <%--<%--%>
        <%--}else if(cdto.getHic_indent() == 4){--%>
        <%--%>--%>
        <%--<option value="<%=cdto.getHic_id()%>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㄴ<%=cdto.getHic_val()%></option>--%>
        <%--<%--%>
        <%--}--%>
        <%--}--%>
        <%--%>--%>
        <%--</select>--%>

        <%--</div>--%>
        <div class="form-group col-md-3">
            <label for="cat_name">카테고리 이름</label>
            <input type="text" class="form-control" id="cat_name" name="cat_name" ng-model="catName"
                   placeholder="신규 혹은 하위 카테고리 이름">
        </div>
        <button class="btn btn-warning" ng-click="catAdd()" ng-disabled="catBtn">생성</button>
        <button class="btn btn-warning" ng-click="catDel()">삭제</button>
    </form>
</div>
</body>

</html>
