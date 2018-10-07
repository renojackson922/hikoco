<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <title>자격증명 확인</title>
</head>
<body>
    <div>
        <h2>비밀번호를 입력해주세요.</h2>
        <form id="form1" name="form1" action="/admin/auth" method="POST">
            <input type="password" name="password">
            <input type="hidden" name="id" value="<%=request.getParameter("id")%>">
            <button type="submit">확인</button>
        </form>
    </div>
</body>
</html>
