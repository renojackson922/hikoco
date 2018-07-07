<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>HIKOCO :: SIGNUP</title>
    <%@include file="./essential/base.jsp"%>
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
