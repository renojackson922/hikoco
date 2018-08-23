<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<html>
<head>
    <title>실크독 심플보드</title>
    <%@include file="./essential/base.jsp"%>
    <style>
        .table td, .table th{
            vertical-align:middle;
            font-size: 0.8rem;
            /*font-size: 0.8rem;*/
            /*width: 25px!important;*/
            /*height: 20px !important;*/
            padding: 1em;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        .table thead th, .table thead td{
            /*background: #e7e7e7;*/
            /*background: rgba(220,20,60,0.7);*/
            /*color: #*/
        }
        td > a{
            text-decoration: none;
            color:#5d5d5d;
        }
        td > a:hover{
            text-decoration: none;
            color:#ccc;
        }
        #filter_label{
            font-size:0.8rem;
        }
        select, option{
            font-size: 0.8rem !important;
            padding:0 !important;
            max-height:2em !important;
        }
        @media screen and (min-width: 0px) and (max-width: 700px) {
            #table-view {
                /*display: block;*/
                width:100%;
            }
        }
        @media screen and (min-width: 701px) and (max-width: 3000px) {
            #table-view {
                width:80%;
                margin:0 auto;
            }
        }
        #search_module{
            padding-top:30px;
        }
    </style>
</head>
<body>
<div class="" style="padding-top:30px;">
    <script>
        $(document).ready(function(){
            var url_string = window.location.href;
            var url = new URL(url_string);
            var category = url.pathname.split('/c').slice(1);

            $('#filter option').each(function(){
                if($(this).val()== category){
                    $(this).attr("selected", "selected"); // attr적용안될경우 prop으로
                }
            });

            history.pushState(null, null, location.href);
            window.onpopstate = function(event) {
                history.go(1);
            };
        });

        var moveByCategory = function(select){
            var tmp = select.options[select.selectedIndex].getAttribute("value");
            window.location.replace('/board/c' + tmp);
        }


    </script>
    <div id="main-banner" class="text-center" style="height:100px;">
        <span style="font-size:3.5rem; font-weight:300; display:block">실크독 심플보드</span>
        <span style="font-weight:300; line-height:0px;">Silkdog Simpleboard</span>
    </div>
    <div id="table-view">
        <div style="display:inline-block;">
            <div class="form-group" style="margin-bottom:0.5em;" style="">
                <select id="filter" class="form-control" onchange="moveByCategory(this)">
                    <option value="0">최근게시물 (100개)</option>
                    <option value="1">자유게시판</option>
                    <option value="2" >질문게시판</option>
                    <option value="3">익명게시판</option>
                    <option value="4">장터게시판</option>
                    <option value="5">신고게시판</option>
                </select>
            </div>
        </div>
        <table class="table table-bordered" style="border-color:#ddd;">
            <thead>
            <th scope="col" style="width:10% !important;">#</th>
            <td style="width:70% !important;">제목</td>
            <td style="width:10% !important;">작성자</td>
            <td style="width:10% !important;">작성일자</td>
            <%--<th scope="col" style="width:10%;">#</th>--%>
            <%--<td style="width:60%;">제목</td>--%>
            <%--<td style="width:15%;">작성자</td>--%>
            <%--<td style="width:15%;">작성일자</td>--%>
            </thead>
            <tbody>
            <c:choose>
                <c:when test="${boardVOList eq '[]'}">
                    <tr>
                        <th colspan="4">
                            <div class="text-center" style="height:300px;">
                            <span style="line-height: 300px; font-size:2.0rem; font-weight:300;">
                                게시글이 없습니다.
                            </span>
                            </div>
                        </th>
                    </tr>
                </c:when>
                <c:otherwise>
                    <c:forEach var="i" items="${boardVOList}">
                        <tr>
                            <th scope="row">${i.id}</th>
                            <c:choose>
                                <c:when test="${i.title.length() gt 20}">
                                    <c:set var="tmp" value="${fn:substring(i.title, 0, 20)}..."></c:set>
                                </c:when>
                                <c:otherwise>
                                    <c:set var="tmp" value="${i.title}"></c:set>
                                </c:otherwise>
                            </c:choose>
                            <td><a href="/board/c${category}/r${i.id}">${tmp}</a></td>
                            <td>${i.username}</td>
                            <td>${i.writedate}</td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
            </tbody>
        </table>
    </div>
    <style>
        #number_module > span{
            font-size:0.8rem;
        }
    </style>
    <div id="number_module" class="text-center">
        <%--<span>&#60; &#60;&#60;/span>--%>
        <c:forEach var="j" begin="1" end="5">
            <span>${j}</span>
        </c:forEach>
        <span>&#62; &#62;&#62;</span>
    </div>
    <div id="search_module" class="text-center" style="padding-bottom:100px;">
        <a href="/c${category}/write" class="btn btn-info">글쓰기</a>
    </div>
</div>
</body>
</html>
