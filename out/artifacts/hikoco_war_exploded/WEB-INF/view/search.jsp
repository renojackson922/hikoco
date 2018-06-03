<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ page import="java.util.*, org.silkdog.maven.hikoco.category.dao.*, org.silkdog.maven.hikoco.category.dto.*" %>
<%@ page import="org.silkdog.maven.hikoco.item.dto.ItemDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
//    int count = (int)request.getAttribute("count");
//    List<CategoryDTO> clist = (List<CategoryDTO>)request.getAttribute("clist");
//    List<ItemDTO> ilist = (List<ItemDTO>)request.getAttribute("ilist");
//
//    int cat_height;
//    // rowNum 도 추가할 것
//    float countDIV = (float)count/6;
//
//    System.out.println("count를 나눈 값: "+ countDIV);
//    if(countDIV > (int)Math.ceil(count / 6)){
//        cat_height = (int)Math.ceil(count/6) + 1;
//    }else{
//        cat_height = (int)Math.ceil(count/6);
//    }
//    System.out.println("count를 반올림한 값 :" + cat_height);
//
//    HashMap map = new HashMap<Integer, String>();
//    for(CategoryDTO cdto : clist){
//        map.put(cdto.getHic_id(), cdto.getHic_val());
//    }
//
//    Set<Map.Entry<Integer, String>> set = map.entrySet();
//    Iterator<Map.Entry<Integer, String>> it = set.iterator();

    List<HashMap> ilist = (List<HashMap>)request.getAttribute("ilist");


//    System.out.println(ilist.listIterator());
//    Iterator it = ilist.listIterator();
//    System.out.println(it);
%>
<html ng-cloak ng-app="app">
<head>
    <title>HIKOCO :: ITEM</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../../resources/script/global.css">
    <%@ include file="./essential/script_collection.jsp"%>

    <style>
        .list-group-item:first-child{
            border-top-left-radius:0px;
            border-top-right-radius:0px;
        }
        .list-group-item:last-child{
            border-bottom-left-radius:0px;
            border-bottom-right-radius:0px;
        }
        .list-group > a{
            font-size:12px;
        }
        .category-td-parent-item{
            padding:0px !important;
            width:144px;
            border-right:0px;
        }
        .category-td-parent-item > a{
            font-size:12px;
            margin:0px;
            padding:5px;
            border-top:0px;
            border-right:0px;
        }

        .category-td-child-item{
            padding:0px !important;
            width:144px;
            border-top:0px !important;
            border-right:0px;
        }

        .category-td-child-item > a{
            font-size:12px;
            margin:0px;
            padding:5px;
            border-top:0px !important;
            border-right:0px;
        }
        .last-row{
            border-right:1px solid #ddd !important;
        }
        /* modal-lg inline size */
        .modal-lg{
            max-width:1000px;
        }

        .modal-span{
            display: block;
        }

        .modal-body{
            height:1000px;
            overflow-y: scroll;
        }
        #myBtn {
            display: none; /* Hidden by default */
            position: fixed; /* Fixed/sticky position */
            bottom: 20px; /* Place the button at the bottom of the page */
            right: 30px; /* Place the button 30px from the right */
            z-index: 99; /* Make sure it does not overlap */
            border: none; /* Remove borders */
            outline: none; /* Remove outline */
            background-color: red; /* Set a background color */
            color: white; /* Text color */
            cursor: pointer; /* Add a mouse pointer on hover */
            padding: 15px; /* Some padding */
            border-radius: 10px; /* Rounded corners */
            font-size: 18px; /* Increase font size */
        }

        #myBtn:hover {
            background-color: #555; /* Add a dark-grey background on hover */
        }
    </style>
    <script type="text/javascript">
        //underscore.js URL parsing code
        var _GET = _.object(_.compact(_.map(location.search.slice(1).split('&'), function (item) {
            if (item) item = item.split('=');
            if (item[1]) item[1] = decodeURIComponent(item[1]);
            return item;
        })));

        var app = angular.module('app', ['timer']);

        // 다른 도메인의 소스 불러오기 필터
        app.filter('trustUrl', function ($sce) {
            return function (url) {
                return $sce.trustAsResourceUrl(url);
            }
        });

        app.controller('ctrl', function ($scope, $http, $interval, $timeout) {
            $scope.hide = 0;

            $scope.hideAndSeek = function(){
                $scope.hide = 1;
            }

            $scope.hideAndSeekDisabled = function(){
                $scope.hide = 0;
            }
        });
    </script>
</head>
<body>
<style>
    span{
        display:block;
    }
</style>
    <div>
        <ul>
        <c:forEach var="i" items="${cnt}">
            <li>
                <span>${i.item_title}</span>
            </li>
        </c:forEach>
        </ul>
    </div>
</body>
<script>
    document.addEventListener("DOMContentLoaded", function(event){
        // document.getElementById('hikoco-nav').style.height = 66;
        document.getElementById('hikoco-nav').style.background = 'rgba(0,0,0,0.8)';
    });
</script>
</html>
