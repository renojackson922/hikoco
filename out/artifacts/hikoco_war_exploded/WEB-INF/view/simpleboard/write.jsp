<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<html>
<head>
    <title>글쓰기</title>
    <%@include file="../essential/base.jsp"%>
    <script type="text/javascript">
        $(document).ready(function() {
            $('#summernote').summernote({
                height: 300,
                minHeight: null,
                maxHeight: null,
                focus: true,
                callbacks: {
                    onImageUpload: function(files, editor, welEditable) {
                        for (var i = files.length - 1; i >= 0; i--) {
                            sendFile(files[i], this);
                        }
                    }
                }
            });
        });

        function sendFile(file, el) {
            var data = new FormData();
            data.append('file', file);
            // console.log(data.url);
            $.ajax({
                data: data,
                type: "POST",
                url: '/imageUpload',
                cache: false,
                contentType: false,
                enctype: 'multipart/form-data',
                processData: false,
                success: function(data) {
                    console.log(data);
                    $(el).summernote('editor.insertImage', data);
                    $('#imageBoard > ul').append('<li><img src="'+ data +'" width="480px" height="auto"/></li>');
                }
            });
        }

        $(document).ready(function(){
            var url_string = window.location.href;
            var url = new URL(url_string);
            var category = (url.pathname.split('/c').slice(1)[0]).split('/write').slice(0)[0];
            // console.log(category);


            $('#category option').each(function(){
                if($(this).val() == category){
                    $(this).attr("selected", "selected"); // attr적용안될경우 prop으로
                }
            });
        });

        var ask = function(){
            if(confirm('정말 나가시겠습니까?\n작업 내용은 저장되지 않습니다.')){
                /** 게시글 작성 시 오류가 있으면 계속 forward 되므로, 이전 페이지로 돌아가면 문제가 생김 */
                window.location.href= '/board/c${category}';
                return true;
            }
            return false;
        }
    </script>
    <style>
        label, input, textarea, select, select > option{
            font-size: 0.8em !important;
        }
        textarea{
            resize: none !important;
        }
        #outBtn{
            text-decoration: none;
            color: crimson;
        }
        #outBtn:hover{
            text-decoration: none;
            color: #7a0f1f;
        }
        .form-error{
            font-size:0.7em;
            color:crimson;
        }
    </style>
</head>
<body>
<spring:hasBindErrors name="boardVO" />
    <div class="container" style="min-width:50%; padding-top:10px;">
        <div style="padding-bottom:20px;">
            <span style="font-size:2.0em; font-weight: 300;">글쓰기</span>
            <div style="float:right;">
                <a id="outBtn" href="javascript:void(0)" onclick="ask()"><i class="fas fa-sign-out-alt" style="font-size:1.6em;"></i></a>
            </div>
            <hr style="border: none; height: 1px; background-color: #ccc; margin:0 auto;"/>
        </div>
        <form id="form1" action="/c${category}/write" method="POST">
            <div class="form-row">
                <div class="form-group col-md-4">
                    <label for="username">아이디</label>
                    <input type="text" id="username" name="username" class="form-control" value="${boardVO.username}"required>
                    <span class="form-error"><form:errors path="boardVO.username"/></span>
                </div>
                <div class="form-group col-md-4">
                    <label for="password">비밀번호</label>
                    <input type="password" id="password" name="password" class="form-control" required>
                    <span class="form-error"><form:errors path="boardVO.password"/></span>

                </div>
                <div class="form-group col-md-4">
                    <label for="passwordConfirm">비밀번호 확인</label>
                    <input type="password" id="passwordConfirm"
                           name="passwordConfirm" class="form-control" required>
                    <span class="form-error"><form:errors path="boardVO.passwordConfirm"/></span>

                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-12">
                    <label for="category">카테고리</label>
                    <select id="category" class="form-control" disabled>
                        <option value="0">-- 선택하세요 --</option>
                        <option value="1">자유게시판</option>
                        <option value="2">질문게시판</option>
                        <option value="3">익명게시판</option>
                        <option value="4">장터게시판</option>
                        <option value="5">신고게시판</option>
                        <option value="6">오버워치</option>
                        <option value="7">몬스터헌터:월드</option>
                        <option value="8">리그오브레전드</option>
                        <option value="9">나와라</option>
                        <option value="10">윾게</option>
                        <option value="11">스게</option>
                        <option value="12">만세a</option>
                    </select>
                </div>
                <input type="hidden" name="category" value="${category}">
            </div>
            <div class="form-row">
                <div class="form-group col-md-12">
                    <label for="title">제목</label>
                    <input type="text" id="title" name="title" class="form-control" value="${boardVO.title}" required>
                    <%--<span class="form-error"><form:errors path="boardVO.title"/></span>--%>
                </div>
            </div>
            <div class="form-row">
                <div class="form group col-md-12">
                    <label for="summernote">본문</label>
                    <%--<textarea id="detail" name="detail" rows="20"--%>
                              <%--class="form-control" placeholder="본문 내용을 입력해주세요."></textarea>--%>
                    <textarea id="summernote" name="detail" class="form-control">${boardVO.detail}</textarea>
                    <%--<span class="form-error"><form:errors path="boardVO.detail"/></span>--%>
                </div>
            </div>
            <div class="text-center" style="padding-top:20px; ">
                <button type="submit" class="btn btn-info">제출</button>
            </div>
        </form>
    </div>
</body>
</html>
