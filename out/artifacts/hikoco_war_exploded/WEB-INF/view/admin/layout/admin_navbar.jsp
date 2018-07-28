<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<script>
    function leaveCurrentPage(){
        if(confirm('메인 페이지로 돌아가시겠습니까?\n작업 내용은 저장되지 않습니다.')){
                window.location.href = "/";
            }else{
                return false;
        }
    }
    function logout(){
        if(confirm('로그아웃 하시겠습니까?\n작업 내용은 저장되지 않습니다.')){
            window.location.href = "/logout";
        }else{
            return false;
        }
    }
</script>
<style>
    .admin-navbar-a{
        color:#fff;
    }
    .admin-navbar-a:hover{
        color:#ccc;
        text-decoration: none;
    }
</style>
<div style="height:60px; background: #000; padding:10px 0 0 15px;">
    <span style="font-size:1.7em; color:#fff; font-weight:200;">MY PAGE</span>
    <a class="admin-navbar-a" href="#" onclick="leaveCurrentPage()" style="font-size:0.8em; font-weight:400; padding-left:20px;">메인으로 돌아가기</a>
    <a class="admin-navbar-a" href="#" onclick="logout()" style="font-size:0.8em; font-weight:400; padding-left:20px;">로그아웃</a>
</div>