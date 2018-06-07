<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="org.silkdog.maven.hikoco.item.dto.ItemDTO" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    List<HashMap> ilist = (List<HashMap>)request.getAttribute("ilist");
    System.out.println(ilist);

//
//    Iterator it = ilist.listIterator();
//
//    Map<String, String> map = (Map<String, String>)it.next();
//
//    List<String> keyList = new ArrayList<>(map.keySet());
//    List<String> valueList = new ArrayList<>(map.values());

//    for(String s : keyList){
//        System.out.println(s);
//    }
//    for(String s : valueList){
//        System.out.println(s);
//    }
%>
<html>
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
</head>
<body>
    <style>
        span{
            display:block;
        }
    </style>
    <div class="container" style="width:50%; margin:0 auto;">
        <form id="form1" name="form1" action="./item_test.do" method="POST">
            <div class="form-group">
                <label>아이템 제목</label>
                <input type="text" class="form-control" name="item_title" required>
            </div>
            <div class="form-group">
                <label>아이템 가격</label>
                <input type="text" class="form-control" name="item_price" required>
            </div>
            <div class="form-group">
                <label>아이템 제조사</label>
                <input type="text" class="form-control" name="item_manu" required>
            </div>
            <div class="form-group">
                <label>아이템 벤더(유통사)</label>
                <input type="text" class="form-control" name="item_vendor" required>
            </div>
            <div class="form-group">
                <label>아이템 요약설명</label>
                <input type="text" class="form-control" name="item_summary" required>
                <small class="muted">&nbsp;추후에 로직으로 대체</small>
            </div>
            <div class="form-group">
                <label>아이템 사진 위치(상대경로)</label>
                <input type="text" class="form-control" name="item_pic" required>
            </div>
            <div class="form-group">
                <label>아이템 설명 위치(상대경로)</label>
                <input type="text" class="form-control" name="item_detail" required>
            </div>
            <button class="btn btn-warning" type="submit">생성</button>
        </form>
    </div>
    <div class="container">
        <ul class="list-group">
        <c:forEach var="i" items="${cnt}">
                <li class="list-group-item">
                    <span>${i.item_id}</span>
                    <span>${i.item_title}</span>
                    <span>${i.item_price}</span>
                    <span>${i.item_manu}</span>
                    <span>${i.item_vendor}</span>
                    <span>${i.item_summary}</span>
                    <span>${i.item_pic}</span>
                    <span>${i.item_detail}</span>
                    <span>${i.item_upload_date}</span>
                    <span>${i.item_last_edited_date}</span>
                </li>
        </c:forEach>
        </ul>
    </div>
</body>
</html>
