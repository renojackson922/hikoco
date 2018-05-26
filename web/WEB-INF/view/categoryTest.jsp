<%@ page import="org.silkdog.maven.hikoco.category.dto.CategoryDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="org.silkdog.maven.hikoco.category.dao.CategoryDAO" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
    List<CategoryDTO> clist = (List<CategoryDTO>)request.getAttribute("clist");

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
            $scope.$watch('catOption', function(){
                if($scope['catOption'] == null || $scope['catOption'] === ''){
                    $scope.catBtn = true;
                }else{
                    $scope.catBtn = false;
                }
            }, true);

            $scope.catAdd = function(){
                if($scope['catName'] == null || $scope['catName'] === '') {
                    window.alert('EMPTY');
                    return false;
                }
                document.form1.action = "/category_test.do";
                document.form1.submit();
                return true;
            }

            $scope.catDel = function(){
                return false;
            }

            $scope.loadData = function(){
                $http({
                    url: '../../resources/json/category.json',
                    method: 'POST',
                    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                }).then(function(response){
                    $scope.data = response.data;
                    console.log($scope.data);
                });
            }

            $scope.loadData();


        });
    </script>
</head>
<body ng-controller="ctrl">
    <div class="container">
        <ul class="list-group">
            <%
                for(CategoryDTO cdto : clist){
                    if(cdto.getHic_parent().equals("-1")){
            %>
            <li class="list-group-item"><%=cdto.getHic_val()%></li>
            <% } else {%>
            <li class="list-group-item">ㄴ <%=cdto.getHic_val()%></li>
            <%}
            }
            %>
        </ul>
        <hr>
        <form id="form1" name="form1" method="POST">
            <style>
                .form-group{
                    float:left;
                }
            </style>
            <div class="form-group col-md-3">
                <label for="cat_exists">기존 카테고리</label>
                <select ng-model="catOption" class="form-control" id="cat_exists" name="cat_exists">
                    <option value="" selected>-- 선택하세요 --</option>
                    <% for(CategoryDTO cdto : clist){
                        if(cdto.getHic_parent().equals("-1")){
                    %>
                    <option value="<%=cdto.getHic_id()%>"><%=cdto.getHic_val()%></option>
                    <% } else {%>
                    <option value="<%=cdto.getHic_id()%>">ㄴ <%=cdto.getHic_val()%></option>
                    <% }
                    }%>
            </select>

            </div>
            <div class="form-group col-md-3">
                <label for="cat_name">카테고리 이름</label>
                <input type="text" class="form-control" id="cat_name" name="cat_name" ng-model="catName" placeholder="신규 혹은 하위 카테고리 이름">
            </div>
                <button class="btn btn-warning" ng-click="catAdd()" ng-disabled="catBtn">생성</button>
                <button class="btn btn-warning" ng-click="catDel()">삭제</button>
        </form>
    </div>
</body>

</html>
