<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<html>
<head>
    <title>DB 입력봇</title>
    <%@ include file="./essential/base.jsp"%>
</head>
<body>
    <div class="container">
        <form id="form1" name="form1" action="/bot" method="POST">
            <div class="form-row">
                <div class="form-group">
                    <label for="times">반복할 수</label>
                    <input type="text" id="times" name="times" class="form-control" placeholder="반복할 횟수를 입력해주세요." style="width:15rem;" required>
                </div>
            </div>
            <button class="btn btn-danger" type="submit">제출</button>
        </form>
    </div>
</body>
</html>
