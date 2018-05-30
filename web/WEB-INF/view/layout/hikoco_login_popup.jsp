    <%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

        <div id="hide" class="animated fadeIn" ng-show="hide" style="display:table; position:absolute; margin:0; width:100%; height:100%; background: rgba(0,0,0,0.5); z-index: 2147483647;">
        <div style="display:table-row">
        <div style="display:table-cell; vertical-align:middle;">
        <style>
        #signInModal:hover{
        text-decoration: none;
        }
        #hikoco-signin{
        /*background: url("../../resources/imgs/signin-bg.gif")  no-repeat center center;*/
        }
        </style>
        <div id="hikoco-signin" class="animated fadeInUp" style="margin:0 auto; width:500px; height:500px; padding-right:15px; background: #fff;">
        <div class="text-right">
        <a id="signInModal" href="#" ng-click="hideAndSeekDisabled(); lockBodyScroll={overflow:'scroll'}"><span style="font-size:1.5em; color:#222;">&times;</span></a>
        </div>
        <div class="text-center unselectable" style="padding:20px;">
        <i class="fas fa-coffee" style="vertical-align: baseline; font-size:1.7em;"></i>  <!-- vertical-align: baseline; // Useful CSS Style -->
        <h1 style="letter-spacing: -2px; display:inline !important;">&nbsp;&nbsp;Cafe HIKOCO</h1>
        </div>
        <div class="hikoco-signin-form" style="display:block; padding:20px 50px 20px 50px;">
        <form id="form1" action="/auth/login.do" method="POST">
        <div class="form-group">
        <label for="hic_email">이메일</label>
        <input type="email" class="form-control" id="hic_email" name="hic_email" required>
        </div>
        <div class="form-group">
        <label for="hic_pw">비밀번호</label>
        <input type="password" class="form-control" id="hic_pw" name="hic_pw" required>
        </div>
        <div class="text-center" style="padding-top:10px;">
        <button type="submit" class="btn btn-info">로그인하기</button>
        </div>
        <div class="text-center" style="padding-top:20px;">
        <input type="checkbox">
        <span>&nbsp;로그인 정보 기억하기</span>
        </div>
        <style>
        .hic-signin-span{
        padding-top:20px;
        }
        .hic-signin-span > span{
        display:block;
        }
        </style>
        <div class="hic-signin-span text-center">
        <span>아이디가 없으신가요? <a href="#">가입하기</a></span>
        <span>비밀번호를 잊어버리셨나요? <a href="#">비밀번호 찾기</a></span>
        </div>
        </form>
        </div>
        </div>
        </div>
        </div>
        </div>