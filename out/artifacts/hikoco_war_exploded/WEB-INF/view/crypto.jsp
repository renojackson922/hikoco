<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html ng-app="app">
<head>
    <title>진형이와 길상이를 위한 페이지</title>
    <meta charset="UTF-8">
    <%@ include file="./essential/base.jsp" %>
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

        app.controller('ctrl', function ($scope, $http, $timeout, myService) {
            myService.getAda().then(function(data){
                $scope.ada = data;
            }, function(){
                $scope.error = 'unable to read CoinMarketCap';
            });

            console.log(myService.getAda());
        });

        app.factory('myService', function($http){
            var getAda = function(){
                return $http.get('https://api.coinmarketcap.com/v2/ticker/2010/');
            };

            return{
                getAda: getAda
            };
        });

    </script>
</head>
<body ng-controller="ctrl">
    <h1>ASS</h1>

</body>
</html>
