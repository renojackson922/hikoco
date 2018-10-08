<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<!-- PC -->
<div class="table-view pc-only" style="width: calc(100% - 220px); padding-left:20px; float:left; overflow-x:hidden;">
    <div style="width:100%; height:135px;">
        <div class="text-center" style="width:100%; height:100px; border:1px solid #5d5d5d;">
            <span id="banner-span" style="font-size:2.0rem; font-weight:300; line-height:100px;"></span>
            <script>
                var getAkaFromJSON = function(){
                    $.getJSON('../../../resources/json/board_category.json', function(result){
                        $.each(result, function(i, field){
                            if(i == category()){
                                console.log(field.name);
                                $('#banner-span').text(field.name);
                            }
                        });
                    });
                };
                getAkaFromJSON();
            </script>
        </div>
        <span id="board-name2" style="float:right; font-size:0.75rem; padding-right:5px; padding-top:10px;">총 게시글 수: 0</span>
    </div>
    <table class="table table-bordered" style="border-color:#ddd;">
        <thead>
        <th scope="col" style="width:10% !important;">#</th>
        <td style="width:70% !important;">제목</td>
        <td style="width:10% !important;">작성자</td>
        <td style="width:10% !important;">작성일자</td>
        <%--<th scope="col" style="width:10%;">#</th>--%>
        <%--<td style="width:60%;">제목</td>--%>
        <%--<td style="width:15%;">작성자</td>--%>
        <%--<td style="width:15%;">작성일자</td>--%>
        </thead>
        <tbody>
        <c:choose>
            <c:when test="${boardVOList eq '[]'}">
                <tr>
                    <th colspan="4">
                        <div class="text-center" style="height:300px;">
                            <span style="line-height: 300px; font-size:2.0rem; font-weight:300;">
                                게시글이 없습니다.
                            </span>
                        </div>
                    </th>
                </tr>
            </c:when>
            <c:otherwise>
                <c:forEach var="i" items="${boardVOList}">
                    <tr>
                        <th scope="row">${i.id}</th>
                        <c:choose>
                            <c:when test="${i.title.length() gt 50}">
                                <c:set var="tmp" value="${fn:substring(i.title, 0, 50)}..."></c:set>
                            </c:when>
                            <c:otherwise>
                                <c:set var="tmp" value="${i.title}"></c:set>
                            </c:otherwise>
                        </c:choose>
                        <td><a href="/board/c${category}/r${i.id}">${tmp}</a></td>
                        <td>${i.username}</td>
                        <td>${i.writedate}</td>
                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>
    <style>
        #number_module > span{
            font-size:0.8rem;
        }
    </style>

    <!-- Desktop Pagination -->
    <div class="pagination_module text-center">
        <nav aria-label="Page navigation example" style="display:inline-block;">
            <ul class="pagination">
                <c:choose>
                    <c:when test="${a eq 1}"></c:when>
                    <c:when test="${pageCnt > 5}">
                        <li class="page-item">
                            <a class="page-link" href="/board/c${category}/p${(a-1)*5}" aria-label="Previous">
                                <span aria-hidden="true">&lsaquo;</span>
                                <span class="sr-only">Previous</span>
                            </a>
                        </li>
                    </c:when>
                    <c:otherwise/>
                </c:choose>
                <c:forEach var="i" begin="${(a * 5) - 4}" end="${a * 5}">
                    <c:if test="${i le pageCnt}">
                        <li class="page-item"><a class="page-link" href="/board/c${category}/p${i}">${i}</a></li>
                    </c:if>
                </c:forEach>
                <c:choose>
                    <c:when test="${pageCnt lt (a*5)}"></c:when>
                    <c:when test="${pageCnt > 5}">
                        <li class="page-item">
                            <a class="page-link" href="/board/c${category}/p${((a+1)*5)-4}" aria-label="Next">
                                <span aria-hidden="true">&rsaquo;</span>
                                <span class="sr-only">Next</span>
                            </a>
                        </li>
                    </c:when>
                    <c:otherwise/>
                </c:choose>

            </ul>
        </nav>
    </div>

    <div class="search_module text-center" style="padding-bottom:100px;">
        <a href="/c${category}/write" class="btn btn-info">글쓰기</a>
    </div>
</div>

<!-- mobile -->
<style>
    .mobile-only-items{
        white-space: initial !important;
        overflow: initial !important;
        text-overflow: initial !important;
    }
    .mobile-only-items-second > span{
        font-weight: 400;
        color: #969696;
    }
</style>
<div id="mobile-scroll-prevent" class="table-view col-md-10 mobile-only" style="float:left; width:100%;">
    <%--모바일데스웅--%>
    <div style="padding-top:10px;">
        <img src="" class="board-banner-img img-fluid mx-auto d-block" style="display:block; margin-bottom:5px;">
    </div>
    <table class="table table-bordered" style="border-color:#ddd;">
        <thead>
        <th scope="col" class="text-center">게시글</th>
        </thead>
        <tbody>

        <c:choose>
            <c:when test="${boardVOList eq '[]'}">
                <tr>
                    <th colspan="4">
                        <div class="text-center" style="height:300px;">
                            <span style="line-height: 300px; font-size:2.0rem; font-weight:300;">
                                게시글이 없습니다.
                            </span>
                        </div>
                    </th>
                </tr>
            </c:when>
            <c:otherwise>
                <c:forEach var="i" items="${boardVOList}">
                    <tr>
                        <td><a href="/board/c${category}/r${i.id}">
                            <div class="mobile-only-items">
                                <div class="mobile-only-items-first" style="padding-bottom:4px;">
                                    <span style="font-size:0.9rem;"><strong>[윾머(임시)]</strong></span>&nbsp;<span style="font-size:0.9rem;">${i.title}</span><br>
                                </div>
                                <div class="mobile-only-items-second">
                                    <span>${i.username}</span>
                                    &nbsp;<span>|</span>&nbsp;
                                    <span>추천 0</span>
                                    &nbsp;<span>|</span>&nbsp;
                                    <span>조회 100</span>
                                    &nbsp;<span>|</span>&nbsp;
                                    <span>${i.writedate}</span>
                                </div>
                            </div>
                        </a>
                        </td>
                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>
    <%--<div class="number_module text-center">--%>
    <%--&lt;%&ndash;<span>&#60; &#60;&#60;/span>&ndash;%&gt;--%>
    <%--<c:forEach var="j" begin="1" end="5">--%>
    <%--<span>${j}</span>--%>
    <%--</c:forEach>--%>
    <%--<span>&#62; &#62;&#62;</span>--%>
    <%--</div>--%>

	<!-- Mobile Pagination -->
    <div class="pagination_module text-center">
        <nav aria-label="Page navigation example" style="display:inline-block;">
            <ul class="pagination">
                <c:choose>
                    <c:when test="${a eq 1}"></c:when>
                    <c:when test="${pageCnt > 5}">
                        <li class="page-item">
                            <a class="page-link" href="/board/c${category}/p${(a-1)*5}" aria-label="Previous">
                                <span aria-hidden="true">&lsaquo;</span>
                                <span class="sr-only">Previous</span>
                            </a>
                        </li>
                    </c:when>
                    <c:otherwise/>
                </c:choose>
                <c:forEach var="i" begin="${(a * 5) - 4}" end="${a * 5}">
                    <c:if test="${i le pageCnt}">
                        <li class="page-item"><a class="page-link" href="/board/c${category}/p${i}">${i}</a></li>
                    </c:if>
                </c:forEach>
                <c:choose>
                    <c:when test="${pageCnt lt (a*5)}"></c:when>
                    <c:when test="${pageCnt > 5}">
                        <li class="page-item">
                            <a class="page-link" href="/board/c${category}/p${((a+1)*5)-4}" aria-label="Next">
                                <span aria-hidden="true">&rsaquo;</span>
                                <span class="sr-only">Next</span>
                            </a>
                        </li>
                    </c:when>
                    <c:otherwise/>
                </c:choose>

            </ul>
        </nav>
    </div>
    <div class="search_module text-center" style="padding-bottom:100px;">
        <a href="/c${category}/write" class="btn btn-info">글쓰기</a>
    </div>
</div>