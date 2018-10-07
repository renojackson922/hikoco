<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head lang="ko" xmlns="http://www.w3.org/1999/xhtml">
    <title>HIKOCO :: SIGNUP</title>
    <%@include file="../essential/base.jsp"%>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <style>
        body{
            position: initial;
            background: url("../../../resources/imgs/bg1_width.jpg");
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
        // var idck = 0;
        // $(function() {
        //     $('#userid').each(function(){
        //         var elem = $(this);
        //
        //         elem.data('oldVal', elem.val());
        //
        //         elem.bind('propertychange change click keyup input paste', function(event){
        //             if(elem.data('oldVal') != elem.val()){
        //                 elem.data('oldVal', elem.val());
        //
        //                 // $('#ass').removeClass('btn-primary');
        //                 // $('#ass').addClass('btn-info');
        //                 document.getElementById("emailHelp").value = 'dd';
        //
        //             }
        //
        //             if(elem.val() == ''){
        //                 // $('#ass').removeClass('btn-info');
        //                 // $('#ass').addClass('btn-primary');
        //
        //                 document.getElementById("emailHelp").value = '회원가입 시 등록했던 이메일 주소를 입력하세요.';
        //             }
        //         });
        //     });

        // $('#userid').on('input', function() {
        //
        //     // var userid =  $("#userid").val();
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
        // });
        var backToHome = function(){
            if(confirm('메인 페이지로 돌아가시겠습니까?\n작업 내용은 저장되지 않습니다.')){
                window.location.href="/shop";
            }else{
                return false;
            }
        }
    </script>
    <script language="javascript">
        // opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
        //document.domain = "abc.go.kr";

        function goPopup(){
            // 주소검색을 수행할 팝업 페이지를 호출합니다.
            // 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
            var pop = window.open("/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes");

            // 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
            //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes");
        }


        function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
            // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
            /* 풀 주소 */
            // document.form1.addr1.value = roadFullAddr;
            // document.form.roadAddrPart1.value = roadAddrPart1;
            // document.form.roadAddrPart2.value = roadAddrPart2;
            document.form1.addr4.value = addrDetail;
            // document.form.engAddr.value = engAddr;
            // document.form.jibunAddr.value = jibunAddr;
            document.form1.zipcode.value = zipNo;
            // document.form.admCd.value = admCd;
            // document.form.rnMgtSn.value = rnMgtSn;
            // document.form.bdMgtSn.value = bdMgtSn;
            // document.form.detBdNmList.value = detBdNmList;
            // /** 2017년 2월 추가제공 **/
            // document.form.bdNm.value = bdNm;
            // document.form.bdKdcd.value = bdKdcd;
            document.form1.addr1.value = siNm;
            document.form1.addr2.value = sggNm;
            // document.form.emdNm.value = emdNm;
            // document.form.liNm.value = liNm;
            document.form1.addr3.value = rn + ' ';
            // document.form.udrtYn.value = udrtYn;
            document.form1.addr3.value += buldMnnm;
            // document.form.buldSlno.value = buldSlno;
            // document.form.mtYn.value = mtYn;
            // document.form.lnbrMnnm.value = lnbrMnnm;
            // document.form.lnbrSlno.value = lnbrSlno;
            // /** 2017년 3월 추가제공 **/
        }
    </script>

</head>
<body>
<spring:hasBindErrors name="memberVO" />
<div id="home-button" style="position:absolute; display:inline-block; top:10px; left:10px; z-index:99999;">
    <button class="btn btn-warning" onclick="backToHome()"><i class="fas fa-home"></i></button>
</div>
<div id="signup-container" style="display:table; position:absolute; height:100%; width:100%;" >
    <div style="display: table-cell; vertical-align: middle !important;">
        <div class="col-lg-8 offset-lg-2" style="background: #fff; padding:20px; margin-left:auto; margin-right:auto;">
            <div class="text-center">
                <span style="font-size:2.8em; font-weight:200; display:block;">CAFE HIKOCO</span>
                <span style="font-size:1.0em; font-weight:200; display:block; line-height:10px;">회원가입</span>
            </div>
            <div class="col-md-10 offset-md-1" style="padding-top:20px;">
                <form id="form1" name="form1" action="/shop/signup_new" method="POST">
                    <div class="form-row">
                        <div class="form-group col-md-11">
                            <label for="userid">이메일</label>
                            <input type="email" class="form-control" id="userid"
                                   name="userid" placeholder="ex) mainnet@silkdog.io" value="${memberVO.userid}" required>
                            <small id="emailHelp" class="form-text text-muted">회원가입 시 등록했던 이메일 주소를 입력하세요.</small>
                            <span class="form-error"><form:errors path="memberVO.userid"/></span>
                        </div>
                        <div class="form-group col-md-1">
                            <a class="btn btn-primary" href="#">확인하기</a>
                        </div>
                        <%--<div class="form-group col-md-1">--%>
                        <%--<img src="../../resources/svg/loading.svg" width="30px">--%>
                        <%--</div>--%>
                    </div>
                    <style>
                        .form-error{
                            font-size:0.7em;
                            color: tomato;
                        }
                    </style>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="password">비밀번호</label>
                            <input type="password" class="form-control" id="password" name="password"
                                   placeholder="비밀번호" required>
                            <span class="form-error"><form:errors path="memberVO.password"/></span>
                            <span class="form-error"><form:errors path="memberVO.passwordConfirm"/></span>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="passwordConfirm">비밀번호 확인</label>
                            <input type="password" class="form-control" id="passwordConfirm" name="passwordConfirm"
                                   placeholder="비밀번호 재입력" required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="realname">실명</label>
                            <input type="text" class="form-control" id="realname" name="realname"
                                   placeholder="ex) 김창후" value="${memberVO.realname}" required>
                            <small id="realnameHelp" class="form-text text-muted">허위기재 시 불이익을 받을 수 있습니다.</small>
                            <span class="form-error"><form:errors path="memberVO.realname"/></span>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="nickname">닉네임</label>
                            <input type="text" class="form-control" id="nickname" name="nickname"
                                   placeholder="ex) DoubleMadew" value="${memberVO.nickname}" required>
                            <span class="form-error"><form:errors path="memberVO.nickname"/></span>
                        </div>
                    </div>
                    <!-- Tier -->
                    <input type="hidden" id="tier" name="tier" value="브론즈">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="phone">휴대폰 번호</label>
                            <input type="text" class="form-control" id="phone" name="phone"
                                   placeholder="ex) 01012345678" value="${memberVO.phone}" required>
                            <span class="form-error"><form:errors path="memberVO.phone"/></span>
                        </div>
                        <!-- 생년월일 -->
                        <input type="hidden" id="birthday" name="birthday" value="19920829">
                        <div class="form-group col-md-6">
                            <label for="sex">성별</label>
                            <select id="sex" class="form-control" name="sex">
                                <option value="0" selected>선택하세요</option>
                                <option value="1">남</option>
                                <option value="2">여</option>
                            </select>
                            <span class="form-error"><form:errors path="memberVO.sex"/></span>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-2">
                            <label for="zipcode">우편번호</label>
                            <div onclick="goPopup()">
                                <input type="text" class="form-control" id="zipcode" name="zipcode"
                                       value="${memberVO.zipcode}" placeholder="주소검색" required readonly>
                            </div>
                            <small id="zipcodeHelp" class="form-text text-muted">도로명주소</small>
                        </div>
                        <div class="form-group col-md-4">
                            <label for="addr1">특별시/도</label>
                            <input type="text" class="form-control" id="addr1" name="addr1"
                                   value="${memberVO.addr1}" required readonly>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="addr2">시/구</label>
                            <input type="text" class="form-control" id="addr2" name="addr2"
                                   value="${memberVO.addr2}" required readonly>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <label for="addr3">상세주소 1 (동)</label>
                            <input type="text" class="form-control" id="addr3" name="addr3"
                                   value="${memberVO.addr3}" placeholder="ex) 바우뫼로 138길 2" required readonly>
                        </div>
                        <div class="form-group col-md-12">
                            <label for="addr4">상세주소 2 (아파트)</label>
                            <input type="text" class="form-control" id="addr4" name="addr4"
                                   value="${memberVO.addr4}" placeholder="ex) 한국아파트 101동 201호" required>
                        </div>
                    </div>
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
                        <div class="g-recaptcha" data-callback="recaptchaCallback()" data-sitekey="6Lcwn2IUAAAAABXHj5EyIM8PlqjHMhJ3cOjMNTPI"></div>
                    </div>
                    <div class="text-xs-center" style="padding-top:10px;">
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
</body>
<script>
    function recaptchaCallback(){
        $('#submit-button').removeAttr('disabled');
    }
    /**
     * Change custom-file-input field after choose a image file.
     * */
    $('.custom-file-input').on('change', function() {
        let fileName = $(this).val().split('\\').pop();
        console.log(fileName);
        $(this).next('.custom-file-label').addClass("selected").html(fileName);
    });

    // $(function(){
    //     function checkInputs(){
    //         var isValid = true;
    //         $('input').filter('[required]').each(function(){
    //             if($(this).val() === ''){
    //                 $('#submit-button').prop('disabled', true);
    //                 isValid = false;
    //                 return false;
    //             }
    //         });
    //         if(isValid){$('#submit-button').prop('disabled', false)}
    //         return isValid;
    //     }
    //
    //     // $('#submit-button').click(function(){
    //     //     alert(checkInputs());
    //     // });
    //
    //     // Enable or disable button based on if inputs are filled or not
    //     $('input').filter('[required]').on('keyup', function(){
    //         checkInputs();
    //     });
    // });
</script>
</html>
