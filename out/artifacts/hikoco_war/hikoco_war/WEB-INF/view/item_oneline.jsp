<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<html>
<head>
    <title>한줄평 작성</title>
    <script src="http://malsup.github.com/jquery.form.js"></script>
    <%@include file="./essential/base.jsp"%>
    <style>
        label{
            font-size:0.8em;
        }
        input, select, textarea{
            font-size:0.8em !important;
        }
    </style>
</head>
<body>
    <div>
        <div style="height:50px; background: crimson; padding-left:10px;">
            <h5 style="color:#fff; font-weight:300; line-height:50px;">한줄평 작성하기</h5>
        </div>
        <div style="padding:10px 30px;">
            <form id="form1" name="form1" method="post">
                <input type="hidden" name="memId" value="${hashMap.get("memId")}">
                <input type="hidden" name="itemId" value="${hashMap.get("itemId")}">
                <div class="form-group">
                    <label for="title">제목</label>
                    <input type="text" class="form-control" id="title" name="title" required>
                </div>
                <div class="form-group">
                    <label for="star">별점</label>
                    <select id="star" name="star" class="form-control">
                        <option value="-1">-- 선택하세요 --</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="detail">한줄평</label>
                    <textarea id="detail" name="detail" class="form-control" placeholder="200자 이내로 작성해주세요." rows="4" required></textarea>
                </div>
                <div class="text-center">
                    <button class="btn btn-info" type="submit">제출</button>
                </div>
            </form>
        </div>
    </div>
</body>
<script type="text/javascript">
    $(document).ready(function(){
        // $("#form1").ajaxForm({url: '/item/itemOneline', type: 'post'});
        $('#form1').submit(function(){
            $(this).ajaxSubmit({url: '/item/itemOneline', type: 'post'});
            // return false;
        }).then(
            function(){
                /** 성공했을 경우 */
                alert('성공!');
                return true;
            }, function(){
                /** 실패했을 경우 */
                alert('실패....');
                return false;
            }
        );
    });
</script>
</html>
