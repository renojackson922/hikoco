<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>HIKOCO :: SIGNUP</title>
    <%@include file="./essential/base.jsp"%>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <style>
        body{
            position: initial;
            background: url("../../resources/imgs/bg1_width.jpg");
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
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
    <script>
        var idck = 0;
        $(function() {
            $('#mem_userid').each(function(){
                var elem = $(this);

                elem.data('oldVal', elem.val());

                elem.bind('propertychange change click keyup input paste', function(event){
                    if(elem.data('oldVal') != elem.val()){
                        elem.data('oldVal', elem.val());

                        // $('#ass').removeClass('btn-primary');
                        // $('#ass').addClass('btn-info');
                        document.getElementById("emailHelp").value = 'dd';

                    }

                    if(elem.val() == ''){
                        // $('#ass').removeClass('btn-info');
                        // $('#ass').addClass('btn-primary');

                        document.getElementById("emailHelp").value = '회원가입 시 등록했던 이메일 주소를 입력하세요.';
                    }
                });
            });

            // $('#mem_userid').on('input', function() {
            //
            //     // var userid =  $("#mem_userid").val();
            //
            //     $('#ass').removeClass('btn-primary');
            //     $('#ass').addClass('btn-info');
            //
            //     // $.ajax({
            //     //     async: true,
            //     //     type : 'POST',
            //     //     data : userid,
            //     //     url : "/isduplicated",
            //     //     dataType : "json",
            //     //     contentType: "application/json; charset=UTF-8",
            //     //     success : function(data) {
            //     //         if (data.cnt > 0) {
            //     //
            //     //             alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
            //     //             //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
            //     //             $("#divInputId").addClass("has-error")
            //     //             $("#divInputId").removeClass("has-success")
            //     //             $("#userid").focus();
            //     //
            //     //         } else {
            //     //             alert("사용가능한 아이디입니다.");
            //     //             //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
            //     //             $("#divInputId").addClass("has-success")
            //     //             $("#divInputId").removeClass("has-error")
            //     //             $("#userpwd").focus();
            //     //             //아이디가 중복하지 않으면  idck = 1
            //     //             idck = 1;
            //     //
            //     //         }
            //     //     },
            //     //     error : function(error) {
            //     //         alert("error : " + error);
            //     //     }
            //     // });
            // });
        });
    </script>
</head>
<body>
<div id="home-button" style="position:absolute; display:inline-block; top:10px; left:10px; z-index:99999;">
    <a href="/" class="btn btn-warning"><i class="fas fa-home"></i></a>
</div>
<div id="signup-container" style="display:table; position:absolute; height:100%; width:100%;" >
    <div style="display: table-cell; vertical-align: middle !important;">
        <div class="col-lg-8 offset-lg-2" style="background: #fff; padding:20px; margin-left:auto; margin-right:auto;">
            <div class="text-center">
                <span style="font-size:2.8em; font-weight:200; display:block;">CAFE HIKOCO</span>
                <span style="font-size:1.0em; font-weight:200; display:block; line-height:10px;">회원가입</span>
            </div>
            <div class="col-md-10 offset-md-1" style="padding-top:20px;">
                <form id="form1" action="/signup_new" method="POST">
                    <div class="form-row">
                        <div class="form-group col-md-11">
                            <%--<button id="ass" class="btn btn-primary">확인</button>--%>
                            <label for="mem_userid">이메일</label>
                            <input type="email" class="form-control" id="mem_userid" name="mem_userid" placeholder="ex) mainnet@silkdog.io" required>
                            <small id="emailHelp" class="form-text text-muted">회원가입 시 등록했던 이메일 주소를 입력하세요.</small>
                        </div>
                        <%--<div class="form-group col-md-1">--%>
                        <%--<img src="../../resources/svg/loading.svg" width="30px">--%>
                        <%--</div>--%>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="mem_password">비밀번호</label>
                            <input type="password" class="form-control" id="mem_password" name="mem_password"
                                   placeholder="비밀번호" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="mem_password_verify">비밀번호 확인</label>
                            <input type="password" class="form-control" id="mem_password_verify"
                                   placeholder="비밀번호 재입력" required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="mem_realname">실명</label>
                            <input type="text" class="form-control" id="mem_realname" name="mem_realname"
                                   placeholder="ex) 김창후" required>
                            <small id="realnameHelp" class="form-text text-muted">허위기재 시 불이익을 받을 수 있습니다.</small>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="mem_nickname">닉네임</label>
                            <input type="text" class="form-control" id="mem_nickname" name="mem_nickname"
                                   placeholder="ex) DoubleMadew" required>
                        </div>
                    </div>
                    <div class="form-row">
                        <%--<div class="form-group col-md-12">--%>
                        <%--<label for="mem_photo">프로필 사진</label>--%>
                        <%--<input type="file" class="form-control" id="mem_photo" name="mem_photo" placeholder="photo">--%>
                        <%--</div>--%>
                        <div class="form-group col-md-12">
                            <label for="mem_photo">프로필 사진</label>
                            <input type="text" class="form-control" id="mem_photo" name="mem_photo" placeholder="photo" required>
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
                            <label for="mem_zipcode">우편번호</label>
                            <input type="text" class="form-control" id="mem_zipcode" name="mem_zipcode" placeholder="ex) 06751" required>
                        </div>
                        <div class="form-group col-md-4">
                            <label for="mem_addr1">특별시/도</label>
                            <select id="mem_addr1" name="mem_addr1" class="form-control">
                                <option selected>선택하세요</option>
                                <option value="서울특별시">서울특별시</option>
                                <option value="붓싼">붓싼</option>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="mem_addr2">시/구</label>
                            <input type="text" class="form-control" id="mem_addr2" name="mem_addr2" required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <label for="mem_addr3">상세주소 1 (동)</label>
                            <input type="text" class="form-control" id="mem_addr3" name="mem_addr3"
                                   placeholder="ex) 바우뫼로 138길 2" required>
                        </div>
                        <div class="form-group col-md-12">
                            <label for="mem_addr4">상세주소 2 (아파트)</label>
                            <input type="text" class="form-control" id="mem_addr4" name="mem_addr4"
                                   placeholder="ex) 한국아파트 101동 201호" required>
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
                    <div class="text-xs-center" style="padding-top:10px;">
                        <div class="g-recaptcha" data-callback="recaptchaCallback" data-sitekey="6Lcwn2IUAAAAABXHj5EyIM8PlqjHMhJ3cOjMNTPI "></div>
                    </div>
                    <div class="text-xs-center" style="padding-top:10px;">
                        <button id="submit-button" type="submit" class="btn btn-primary" disabled>회원가입 하기</button>
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
</body>
<script>
    function recaptchaCallback(){
        $('#submit-button').removeAttr('disabled');
    }
</script>
</html>
