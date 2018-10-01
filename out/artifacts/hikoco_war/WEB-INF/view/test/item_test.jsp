<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>

<%
    List<HashMap> ilist = (List<HashMap>) request.getAttribute("ilist");
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
    <%@ include file="../essential/base.jsp"%>
</head>
<body>
<style>
    span {
        display: block;
    }
</style>
<a class="btn btn-info" href="/">홈으로</a>
<div class="container" style="width:50%; margin:0 auto;">
    <form id="form1" name="form1" action="./item_test" method="POST">
        <div class="form-group">
            <label>아이템 제목</label>
            <input type="text" class="form-control" name="item_title" required>
        </div>
        <div class="form-group">
            <label>아이템 가격</label>
            <input type="text" class="form-control" name="item_price" value="0" required>
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
            <input type="text" class="form-control" name="item_pic" value="../../resources/imgs/items/palit.jpg"
                   required>
        </div>
        <div class="form-group">
            <label>아이템 설명 위치1(상대경로)</label>
            <input type="text" class="form-control" name="item_detail"
                   value="../../resources/imgs/items_detail/palit_detail.jpg" required>
        </div>
        <div class="form-group">
            <label>아이템 설명 위치2(상대경로) - OPTIONAL</label>
            <input type="text" class="form-control" name="item_detail2">
        </div>
        <div class="form-group">
            <label>아이템 설명 위치2(상대경로) - OPTIONAL</label>
            <input type="text" class="form-control" name="item_detail3">
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
                <span>${i.item_detail2}</span>
                <span>${i.item_detail3}</span>
                <span>${i.item_upload_date}</span>
                <span>${i.item_last_edited_date}</span>
                <hr/>
                <a class="btn btn-sm btn-info" href="#">수정하기</a>
                <form id="form2" name="form2" action="./item_test?action=remove" method="POST">
                    <input type="hidden" name="item_id" value="${i.item_id}">
                    <button type="submit" class="btn btn-sm btn-danger">삭제하기</button>
                </form>
            </li>
        </c:forEach>
    </ul>
</div>
</body>
</html>
