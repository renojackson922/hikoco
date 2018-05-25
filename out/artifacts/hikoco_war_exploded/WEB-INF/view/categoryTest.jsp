<%@ page import="org.silkdog.maven.hikoco.category.dto.CategoryDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="org.silkdog.maven.hikoco.category.dao.CategoryDAO" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
    List<CategoryDTO> clist = (List<CategoryDTO>)request.getAttribute("clist");

%>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <!-- Bootstrap 4.1.1 & jQuery-Slim -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
          integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
            integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
            crossorigin="anonymous"></script>
</head>
<body>
    <div class="container">
        <ul class="list-group">
            <%
                for(CategoryDTO cdto : clist){
                    if(cdto.getHic_parent().equals("-1")){
            %>
            <li class="list-group-item"><%=cdto.getHic_val()%></li>
            <% } else {%>
            <li class="list-group-item">ㄴ <%=cdto.getHic_val()%></li>
            <%}
            }
            %>
        </ul>
        <hr>
        <form id="form1" action="/categoryTest_PRO.do" method="POST">
            <style>
                .form-group{
                    float:left;
                }
            </style>
            <div class="form-group col-md-3">
                <label for="cat_exists">기존 카테고리</label>
                <select class="form-control" id="cat_exists">
                    <% for(CategoryDTO cdto : clist){
                        if(cdto.getHic_parent().equals("-1")){
                    %>
                    <option value="<%=cdto.getHic_id()%>"><%=cdto.getHic_val()%></option>
                    <% } else {%>
                    <option value="<%=cdto.getHic_id()%>">ㄴ <%=cdto.getHic_val()%></option>
                    <% }
                    }%>
            </select>

            </div>
            <div class="form-group col-md-3">
                <label for="cat_name">카테고리 이름</label>
                <input type="text" class="form-control" id="cat_name" name="cat_name" placeholder="신규 혹은 하위 카테고리 이름">
            </div>

        </form>
    </div>
</body>
</html>
