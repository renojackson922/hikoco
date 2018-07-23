<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<html>
<head>
    <title>개인정보 수정</title>
    <%@ include file="../essential/base.jsp"%>
    <style>
        body{
            position: initial;
            /*background: url("../../resources/imgs/bg1_width.jpg");*/
            /*background-repeat: no-repeat;*/
            /*background-attachment: fixed;*/
            /*background-size: cover;*/
        }
        input, label, select, option{
            font-size:0.8em !important;
            height:30px !important;
        }
        small{
            font-size:0.7em !important;
        }
        select{
            height:30px !important;
        }
        label{
            margin:0 !important;
            line-height:30px !important;
        }
        .form-group{
            margin-bottom:8px !important;
        }
    </style>
</head>
<body>
<div class="containter" style="padding:20px 50px 20px 50px;">
    <span style="font-size:2.0em; font-weight:300;">개인정보수정</span>
    <hr/>
    <form id="form1" name="form1" action="/memberedit" method="POST">
        <%--<span style="font-size:1.5em; font-weight:300 !important;">${memberInfo.id}</span>--%>
        <div class="form-row">
            <div class="form-group col-md-3">
                <label for="id">회원번호</label>
                <input type="text" class="form-control" id="id" value="${memberInfo.id}" disabled>
            </div>
            <div class="form-group col-md-3">
                <label for="regdate">가입일자</label>
                <input type="text" class="form-control" id="regdate" value="${memberInfo.regdate}" disabled>
            </div>
            <div class="form-group col-md-3">
                <label for="addr3">마지막 로그인 시간</label>
                <input type="text" class="form-control" id="lastlogin_datetime" name="lastlogin_datetime" value="${memberInfo.lastlogin_datetime}" disabled>
            </div>
            <div class="form-group col-md-3">
                <label for="addr4">마지막 로그인 IP</label>
                <input type="text" class="form-control" id="lastlogin_ip" name="lastlogin_ip" value="${memberInfo.lastlogin_ip}" disabled>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="userid">이메일</label>
                <input type="email" class="form-control" id="userid" name="userid" value="${memberInfo.userid}" readonly>
            </div>
            <div class="form-group col-md-6">
                <label for="password">비밀번호</label>
                <input type="password" class="form-control" id="password" name="password">
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="realname">실명</label>
                <input type="text" class="form-control" id="realname" name="realname" value="${memberInfo.realname}" readonly>
            </div>
            <div class="form-group col-md-6">
                <label for="nickname">닉네임</label>
                <input type="text" class="form-control" id="nickname" name="nickname" value="${memberInfo.nickname}">
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-12">
                <label for="tier">등급&nbsp;&nbsp;<strong>(이전등급: ${memberInfo.tier})</strong></label>
                <select class="form-control" id="tier" name="tier">
                    <option selected>--- 선택하세요 ---</option>
                    <option>브론즈</option>
                    <option>실버</option>
                    <option>골드</option>
                    <option>플래티넘</option>
                    <option>다이아몬드</option>
                    <option>아다만티움</option>
                </select>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-12">
                <label for="zipcode">우편번호</label>
                <input type="text" class="form-control" id="zipcode" name="zipcode" value="${memberInfo.zipcode}">
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="addr1">주소1</label>
                <input type="text" class="form-control" id="addr1" name="addr1" value="${memberInfo.addr1}">
            </div>
            <div class="form-group col-md-6">
                <label for="addr2">주소2</label>
                <input type="text" class="form-control" id="addr2" name="addr2" value="${memberInfo.addr2}">
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="addr3">주소3</label>
                <input type="text" class="form-control" id="addr3" name="addr3" value="${memberInfo.addr3}">
            </div>
            <div class="form-group col-md-6">
                <label for="addr4">주소4 (상세주소)</label>
                <input type="text" class="form-control" id="addr4" name="addr4" value="${memberInfo.addr4}">
            </div>
        </div>
    </form>
</div>
</body>
</html>
