<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
    <script type="text/javascript">
        $(document).ready(function() {

			// var str = ;
			<%--ConvertSystemSourcetoHtml('${boardVO.detail}');--%>
			<%--var str = ${boardVO.detail};--%>


            $('#detail').summernote({
                focus: true,
                tabsize: 2,
                height: 500
            });

            $('#detail').summernote('code', '${boardVO.detail}');

			<%--$('.card-block').append('${boardVO.detail}');--%>

        });

        $(document).ready(function(){
            var url_string = window.location.href;
            var url = new URL(url_string);
            var category = (url.pathname.split('/c').slice(1)[0]).split('/r').slice(0)[0];
            console.log(category);


            $('#category option').each(function(){
                if($(this).val() == category){
                    $(this).attr("selected", "selected"); // attr적용안될경우 prop으로
                }
            });
        });

		function ConvertSystemSourcetoHtml(str){
			str = str.replace("&lt;","<");
			str = str.replace("&gt;",">");
			str = str.replace("&quot;",'"');
			str = str.replace("&#39;","'");
			str = str.replace("<br>","\n");
			str = str.replace("<br />","\n");
			return str;
		}

        var ask = function(){
            if(confirm('정말 나가시겠습니까?\n작업 내용은 저장되지 않습니다.')){
                window.location.href= document.referrer;
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
    </style>
    <div id="editArticle-wrapper">
		<!-- 서브 게시판 배너 -->
		<%@ include file="../layout/subBanner.jsp" %>
        <div style="padding-bottom:20px;">
            <span style="font-size:2.0em; font-weight: 300;">글 수정</span>
            <div style="float:right;">
                <a id="outBtn" href="javascript:void(0)" onclick="ask()"><i class="fas fa-sign-out-alt" style="font-size:1.6em;"></i></a>
            </div>
            <hr style="border: none; height: 1px; background-color: #ccc; margin:0 auto;"/>
        </div>

        <form id="form1" enctype="application/x-www-form-urlencoded" action="/board/c${category}/r${boardVO.id}/edit" method="POST">
            <input type="hidden" id="id" name="id" value="${boardVO.id}}">
            <div class="form-row">
                <div class="form-group col-md-4">
                    <label for="username">아이디</label>
                    <input type="text" id="username" name="username" class="form-control comment-text" value="${boardVO.username}"required>
                </div>
                <div class="form-group col-md-4">
                    <label for="password">비밀번호</label>
                    <input type="password" id="password" name="password" class="form-control comment-text" required>
                </div>
                <div class="form-group col-md-4">
                    <label for="passwordConfirm">비밀번호 확인</label>
                    <input type="password" id="passwordConfirm"
                           name="passwordConfirm" class="form-control comment-text" required>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-12">
                    <input type="hidden" name="category" value="${category}">
                    <label for="category">카테고리</label>
                    <select id="category" class="form-control" style="padding-left:10px !important;" disabled>
                        <option value="-1">-- 선택하세요 --</option>
                        <option value="1">자유게시판</option>
                        <option value="2">질문게시판</option>
                        <option value="3">익명게시판</option>
                        <option value="4">장터게시판</option>
                        <option value="5">신고게시판</option>
                    </select>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-12">
                    <label for="title">제목</label>
                    <input type="text" id="title" name="title" class="form-control comment-text" value="${boardVO.title}" required>
                </div>
            </div>
            <div class="form-row">
                <div class="form group col-md-12">
                    <label for="detail">본문</label>
                    <textarea id="detail" name="detail" class="form-control"></textarea>
                    <%--<input type="hidden" name="detail" id="detail">--%>
                </div>
            </div>
            <div class="text-center" style="padding-top:20px;">
                <button type="submit" class="btn btn-info">제출</button>
            </div>
        </form>
    </div>
<script>
	$(function(){
		$('.card-block').css({'height':'550px', 'resize': 'none','background-color':'none'});
		$('.note-resizebar').css('display','none');
	});
</script>

