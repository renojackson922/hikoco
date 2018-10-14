<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head lang="ko" xmlns="http://www.w3.org/1999/xhtml">
	<title>Simpleboard :: SIGNUP</title>
	<%@include file="../essential/base.jsp"%>
	<link rel="stylesheet" href="../../../resources/script/template.css">
	<script src="https://www.google.com/recaptcha/api.js" async defer></script>
	<style>
		body{
			position: initial;
			background: url("../../../resources/imgs/moodbg.jpg") no-repeat fixed;
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
</head>
<body>
<spring:hasBindErrors name="sbMemberVO" />
<div id="home-button" style="position:absolute; display:inline-block; top:10px; left:10px; z-index:99999;">
	<button class="btn btn-warning" onclick="backToHome()"><i class="fas fa-home"></i></button>
</div>
<div id="signup-container" style="display:table; position:relative; height:100%; width:100%;" >
	<div style="display: table-cell; vertical-align: middle !important;">
		<div class="col-lg-8 offset-lg-2" style="background: #fff; padding:20px; margin-left:auto; margin-right:auto;">
			<div class="text-center">
				<span style="font-size:2.8em; font-weight:200; display:block;">Silkdog Simpleboard</span>
				<span style="font-size:1.0em; font-weight:200; display:block; line-height:10px;">회원가입</span>
			</div>
			<div class="col-md-10 offset-md-1" style="padding-top:20px;">
				<form id="form1" name="form1" action="/board/signup" method="POST">
					<div class="form-row">
						<div class="form-group col-md-10">
							<label for="username">이메일</label>
							<input type="email" class="form-control" id="username"
								   name="username" placeholder="ex) mainnet@silkdog.io" value="${sbMemberVO.username}" required>
							<small id="emailHelp" class="form-text text-muted">로그인 시 아이디로 사용할 이메일 주소를 입력하세요.</small>
							<span class="form-error"><form:errors path="sbMemberVO.username"/></span>
						</div>
						<div id="password-check" class="form-group col-md-2">
							<a class="btn btn-secondary signature-btn" href="javascript:void(0)" onclick="checkDuplicatedAccount(this)" style="height:30px; width:100%; font-size:0.8rem; padding:4px 10px;">중복확인</a>
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
							<span class="form-error"><form:errors path="sbMemberVO.password"/></span>
							<span class="form-error"><form:errors path="sbMemberVO.passwordConfirm"/></span>
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
								   placeholder="ex) 김창후" value="${sbMemberVO.realname}" required>
							<small id="realnameHelp" class="form-text text-muted">허위기재 시 불이익을 받을 수 있습니다.</small>
							<span class="form-error"><form:errors path="sbMemberVO.realname"/></span>
						</div>
						<div class="form-group col-md-6">
							<label for="nickname">닉네임</label>
							<input type="text" class="form-control" id="nickname" name="nickname"
								   placeholder="ex) DoubleMadew" value="${sbMemberVO.nickname}" required>
							<span class="form-error"><form:errors path="sbMemberVO.nickname"/></span>
						</div>
					</div>
					<!-- Tier -->
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="phone">휴대폰 번호</label>
							<input type="text" class="form-control" id="phone" name="phone"
								   placeholder="ex) 01012345678" value="${sbMemberVO.phone}" required>
							<span class="form-error"><form:errors path="sbMemberVO.phone"/></span>
						</div>
						<!-- 생년월일 -->
						<%--<input type="hidden" id="birthday" name="birthday" value="19920829">--%>
						<div class="form-group col-md-6">
							<label for="gender">성별</label>
							<select id="gender" class="form-control" name="gender">
								<option value="0" selected>선택하세요</option>
								<option value="1">남</option>
								<option value="2">여</option>
							</select>
							<span class="form-error"><form:errors path="sbMemberVO.gender"/></span>
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
						<button id="submit-button" type="submit" class="btn btn-primary signature-btn">회원가입 하기</button>
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

	var checkDuplicatedAccount = function(data){
		var username = $('#username').val();
		// console.log(username);
		var emailRegex = new RegExp('[0-9a-zA-Z]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$');
		// console.log(emailRegex.test(username));
		/** regex 형식 확인하기 */
		if(username == '' || '' == username){
			alert('이메일을 입력해주세요.');
		}else if(!emailRegex.test(username)){
			alert('올바른 이메일을 입력해주세요.');
		}else{
			$.post('/board/checkAccount', { username: username }, function(data){
				// console.log(data);
				if(data == 0){
					alert('사용할 수 있는 이메일 주소 입니다.');
				}else if(data == 1){
					alert('이미 존재하는 이메일 주소 입니다.\n다른 이메일 주소를 입력하시거나\n비밀번호 찾기 기능을 이용해주세요.');
				}else{
					alert('오류가 발생했습니다. 잠시 후에 다시 시도해주세요.');
				}
			});
		}
	};

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
