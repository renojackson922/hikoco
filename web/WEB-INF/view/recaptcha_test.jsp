<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html ng-app="app">
<head>
    <title>Title</title>
    <%@include file="./essential/base.jsp"%>
    <script src='https://www.google.com/recaptcha/api.js'></script>
    <script type="text/javascript">
        //underscore.js URL parsing code
        var _GET = _.object(_.compact(_.map(location.search.slice(1).split('&'), function (item) {
            if (item) item = item.split('=');
            if (item[1]) item[1] = decodeURIComponent(item[1]);
            return item;
        })));

        var app = angular.module('app', []);

        // 다른 도메인의 소스 불러오기 필터
        app.filter('trustUrl', function ($sce) {
            return function (url) {
                return $sce.trustAsResourceUrl(url);
            }
        });

        app.controller('ctrl', function ($scope, $http) {
            // var headers = {
            //     // 'Authorization': 'Basic ' + btoa(username + ":" + password),
            //     'Access-Control-Allow-Origin': '*',
            //     'Content-Type': 'application/json; charset=utf-8',
            //     "X-Requested-With": "XMLHttpRequest"
            // }
            //
            // $scope.verifier = function(){
            //     $http({
            //         method : 'POST',
            //         url: 'https://www.google.com/recaptcha/api/siteverify',
            //         async: false,
            //         headers: headers
            //     }).then(function mySuccess(response){
            //         $scope.myWelcome = response.data;
            //         console.log($scope.myWelcome);
            //     }, function myError(response){
            //         $scope.myWelcome = response.statusText;
            //     });
            // }
        });
    </script>
</head>
<body ng-controller="ctrl">
    <form action="/verifier" method="POST">
        <div class="g-recaptcha" data-sitekey="6Lcwn2IUAAAAABXHj5EyIM8PlqjHMhJ3cOjMNTPI"></div>
        <button type="submit" class="btn btn-primary">테스트</button>
    </form>
</body>
</html>
