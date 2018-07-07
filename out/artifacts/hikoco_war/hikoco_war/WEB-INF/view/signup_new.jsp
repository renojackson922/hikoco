<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>HIKOCO :: SIGNUP</title>
    <%@include file="./essential/base.jsp"%>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <style>
        body{
            background: url("../../resources/imgs/bg1.jpg");
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
<div id="signup-container">
    <div style="display:table; position:fixed !important; height:100%; width:100%;"> <!-- absolute, originally -->

        <div style="display:table-cell; vertical-align: middle;">

            <div style="margin-left:auto; margin-right:auto; background: #fff; width:800px; height:1000px; padding:20px;">
                <div id="home-button" style="position:absolute; display:inline-block; top:10px; left:10px;">
                    <%--<span style="font-size:2em; color:#fff; line-height:10px;">        <a href="#">&times;</a></span>--%>
                    <a href="/" class="btn btn-warning"><i class="fas fa-home"></i></a>
                </div>
                <div class="text-center">
                    <%--<span style="font-size:2.8em; font-weight:200; display:block;">CAFE HIKOCO</span>--%>
                    <span style="font-size:1.0em; font-weight:200; display:block; line-height:10px;">회원가입</span>
                </div>
                <div class="col-md-8 offset-md-2" style="padding-top:30px;">
                <form id="form1" action="/" method="POST">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="mem_userid">이메일</label>
                            <input type="email" class="form-control" id="mem_userid" name="mem_userid" placeholder="Email">
                            <small id="emailHelp" class="form-text text-muted">회원가입 시 등록했던 이메일 주소를 입력하세요.</small>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="mem_password">비밀번호</label>
                            <input type="password" class="form-control" id="mem_password" name="mem_password"
                                   placeholder="Password">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="mem_realname">실명</label>
                            <input type="text" class="form-control" id="mem_realname" name="mem_realname"
                                   placeholder="Realname">
                            <small id="realnameHelp" class="form-text text-muted">허위기재 시 불이익을 받을 수 있습니다.</small>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="mem_nickname">닉네임</label>
                            <input type="text" class="form-control" id="mem_nickname" name="mem_nickname"
                                   placeholder="Nickname">
                        </div>
                    </div>
                    <div class="form-row">
                        <%--<div class="form-group col-md-12">--%>
                        <%--<label for="mem_photo">프로필 사진</label>--%>
                        <%--<input type="file" class="form-control" id="mem_photo" name="mem_photo" placeholder="photo">--%>
                        <%--</div>--%>
                        <div class="form-group col-md-12">
                            <label for="mem_photo">프로필 사진</label>
                            <input type="text" class="form-control" id="mem_photo" name="mem_photo" placeholder="photo">
                        </div>
                    </div>
                    <!-- Tier -->
                    <input type="hidden" id="mem_tier" name="mem_tier" value="브론즈">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="mem_phone">휴대폰 번호</label>
                            <input type="text" class="form-control" id="mem_phone" name="mem_phone"
                                   placeholder="ex) 01012345678">
                        </div>
                        <!-- 생년월일 -->
                        <input type="hidden" id="mem_birthday" name="mem_birthday" value="19920829">
                        <%--<div class="form-group col-md-6">--%>
                        <%--<label for="mem_sex">성별</label>--%>
                        <%--<select id="mem_sex" class="form-control" name="mem_sex">--%>
                        <%--<option selected>선택하세요</option>--%>
                        <%--<option value="1">남</option>--%>
                        <%--<option value="2">여</option>--%>
                        <%--</select>--%>
                        <%--</div>--%>
                        <input type="hidden" id="mem_sex" name="mem_sex" value="1">
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-2">
                            <label for="mem_zipcode">Zip</label>
                            <input type="text" class="form-control" id="mem_zipcode" name="mem_zipcode">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="mem_addr1">State</label>
                            <select id="mem_addr1" name="mem_addr1" class="form-control">
                                <option selected>선택하세요</option>
                                <option value="서울특별시">서울특별시</option>
                                <option value="붓싼">붓싼</option>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="mem_addr2">City</label>
                            <input type="text" class="form-control" id="mem_addr2" name="mem_addr2">
                        </div>
                        <div class="form-group">
                            <label for="mem_addr3">Address</label>
                            <input type="text" class="form-control" id="mem_addr3" name="mem_addr3"
                                   placeholder="1234 Main St">
                        </div>
                        <div class="form-group">
                            <label for="mem_addr4">Address 2</label>
                            <input type="text" class="form-control" id="mem_addr4" name="mem_addr4"
                                   placeholder="Apartment, studio, or floor">
                        </div>
                    </div>
                    <%--<div class="form-group">--%>
                    <%--<div class="form-check">--%>
                    <%--<input class="form-check-input" type="checkbox" id="gridCheck">--%>
                    <%--<label class="form-check-label" for="gridCheck">--%>
                    <%--Check me out--%>
                    <%--</label>--%>
                    <%--</div>--%>
                    <%--</div>--%>
                    <style>
                        .text-xs-center {
                            text-align: center;
                        }
                        .g-recaptcha{
                            display: inline-block !important;
                        }
                        #submit-button{
                            display: inline-block !important;
                        }
                    </style>
                    <div class="text-xs-center">
                        <div class="g-recaptcha" data-sitekey="6Lcwn2IUAAAAABXHj5EyIM8PlqjHMhJ3cOjMNTPI "></div>
                    </div>
                    <div class="text-xs-center">
                        <button id="submit-button" type="submit" class="btn btn-primary">회원가입 하기</button>
                    </div>
                </form>
                </div>
                <style>
                    .signup-container-sub{
                        padding:20px 0;
                    }
                    .signup-container-sub > span{
                        display: block;
                        font-size:0.8em;
                    }
                </style>
            </div>
        </div>
    </div>
</div>
</body>
</html>
