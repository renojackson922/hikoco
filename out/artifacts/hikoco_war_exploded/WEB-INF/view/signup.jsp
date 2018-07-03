<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HIKOCO :: SIGNUP</title>
    <!-- Vue.js Development -->
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <!-- Bootstrap 4.1.1 & jQuery-Slim -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
          integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <!-- 주의! animated 를 위해서 slim 이 아닌 uncompressed를 사용했음. 문제를 해결하면 slim 으로 바꿀 것 -->
    <script src="http://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
            integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
            crossorigin="anonymous"></script>
    <!-- Load Montstreet Fonts -->
    <link rel="stylesheet" href="/public/css/fonts.css">
    <!-- Font-Awesome -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.9/js/all.js"
            integrity="sha384-8iPTk2s/jMVj81dnzb/iFR2sdA7u06vHJyyLlAd4snFpCl/SnyUjRrbdJsw1pGIl"
            crossorigin="anonymous"></script>
    <!-- Underscore.js -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/underscore.js/1.8.3/underscore.js"></script>
    <!-- Animate.css -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css"
          integrity="sha384-OHBBOqpYHNsIqQy8hL1U+8OXf9hH6QRxi0+EODezv82DfnZoV7qoHAZDwMwEJvSw"
          crossorigin="anonymous">
    <script src="/public/js/headroom.min.js"></script>
    <!-- Summernote -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>
</head>
<body>
<div style="display:table;">
    <div style="display:table-row">
        <div style="display:table-cell; padding:40px;">
            <form id="form1" action="/signup.do" method="POST">
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
                <button type="submit" class="btn btn-primary">회원가입 하기</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
