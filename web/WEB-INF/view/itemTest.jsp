<%@ page import="org.silkdog.maven.hikoco.item.dao.ItemDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="org.silkdog.maven.hikoco.item.dto.ItemDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<ItemDTO> ilist = (List<ItemDTO>)request.getAttribute("ilist");
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
                <input type="text" class="form-control" name="item_title">
            </div>
            <div class="form-group">
                <label>아이템 제조사</label>
                <input type="text" class="form-control" name="item_manu">
            </div>
            <div class="form-group">
                <label>아이템 벤더(유통사)</label>
                <input type="text" class="form-control" name="item_vendor">
            </div>
            <div class="form-group">
                <label>아이템 요약설명</label>
                <input type="text" class="form-control" name="item_summary">
                <small class="muted">&nbsp;추후에 로직으로 대체</small>
            </div>
            <div class="form-group">
                <label>아이템 사진 위치(상대경로)</label>
                <input type="text" class="form-control" name="item_pic">
            </div>
            <div class="form-group">
                <label>아이템 설명 위치(상대경로)</label>
                <input type="text" class="form-control" name="item_detail">
            </div>
            <button class="btn btn-warning" type="submit">생성</button>
        </form>
    </div>
    <div class="container">
        <ul class="list-group">
            <% for(ItemDTO idto : ilist){ %>
                <li class="list-group-item">
                    <span><%=idto.getItem_id()%></span>
                    <span><%=idto.getItem_title()%></span>
                    <span><%=idto.getItem_manu()%></span>
                    <span><%=idto.getItem_vendor()%></span>
                    <span><%=idto.getItem_summary()%></span>
                    <img src="<%=idto.getItem_pic()%>">
                    <span><%=idto.getItem_detail()%></span>
                    <span><%=idto.getItem_upload_date()%></span>
                    <span><%=idto.getItem_last_edited_date()%></span>
                </li>
            <% } %>
        </ul>
    </div>
</body>
</html>
