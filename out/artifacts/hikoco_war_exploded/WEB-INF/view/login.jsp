<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>HIKOCO :: LOGIN</title>
    <%@include file="./essential/base.jsp"%>
    <style>
        body{
            background: url("../../resources/imgs/bg1.jpg");
        }
    </style>
</head>
<body>
<div id="login-container">
    <div style="display:table; position:fixed !important; height:100%; width:100%;"> <!-- absolute, originally -->

        <div style="display:table-cell; vertical-align: middle;">

            <div style="margin-left:auto; margin-right:auto; background: #fff; width:500px; height:500px; padding:70px 50px;">
                <%-- Clickable home button --%>
                <div id="home-button" style="position:absolute; display:inline-block; top:10px; left:10px; z-index:99999;">
                    <a href="/" class="btn btn-warning"><i class="fas fa-home"></i></a>
                </div>
                <div class="text-center">
                    <span style="font-size:2.8em; font-weight:200; ">CAFE HIKOCO</span>
                </div>
                <form id="form1" action="/login.do" method="POST">
                    <div class="form-group">
                        <label for="exampleInputEmail1">이메일</label>
                        <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
                               placeholder="이메일">
                        <small id="emailHelp" class="form-text text-muted">회원가입 시 등록했던 이메일 주소를 입력하세요.</small>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">비밀번호</label>
                        <input type="password" class="form-control" id="exampleInputPassword1" placeholder="비밀번호">
                    </div>
                    <%--<div class="form-group form-check text-center">--%>
                        <%--<input type="checkbox" class="form-check-input" id="exampleCheck1">--%>
                        <%--<label class="form-check-label" for="exampleCheck1">기억하기</label>--%>
                    <%--</div>--%>
                    <div class="text-center">
                        <button type="submit" class="btn btn-warning">로그인</button>
                        <%--<button type="button" class="btn btn-info">비밀번호 찾기</button>--%>
                    </div>
                </form>
                <style>
                    .login-container-sub{
                        padding:20px 0;
                    }
                    .login-container-sub > span{
                        display: block;
                        font-size:0.8em;
                    }
                </style>
                <div class="login-container-sub col-md-9 offset-md-3">
                    <span>아직 회원이 아니신가요?&nbsp;&nbsp;<a href="<c:url value="/signup_new"/>">회원가입하기</a></span>
                    <span>비밀번호를 잊어버리셨나요?&nbsp;&nbsp;<a href="#">비밀번호찾기</a></span>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
