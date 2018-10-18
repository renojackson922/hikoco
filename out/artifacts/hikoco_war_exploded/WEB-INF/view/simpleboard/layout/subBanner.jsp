<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>

<div style="width:100%; height:135px;">
<div class="sb-subbanner text-center">
<span class="sb-subbanner-span" style="font-size:2.0rem; font-weight:300; line-height:100px;"></span>
</div>
<span id="sb-subbanner-amount" style="float:right; font-size:0.75rem; padding:10px 5px 5px 0;">총 게시글 수:&nbsp;${getListCountByCategory}</span>
</div>