<div id="shadow" style="position:fixed; display:none; z-index:9998; width:100%; height:100%; background: rgba(0,0,0,0.8)"></div>
<button onclick="verticalScrollMenu()" id="vertical-scrollBtn" title="모바일 메뉴 보기"><i class="fas fa-bars"></i></button>
<!-- 모바일용 스크롤링  메뉴 -->
<div id="menu-view-verticalScroll" class="animated slideInLeft col-md-2" style="display:none; padding-right:20% !important;">
    <div id="list-filter-vert__close" style="height:20px; position:fixed; top:0px; right:10px;">
        <a id="times" href="javascript:void(0)" onclick="verticalScrollRestore()"><span style="font-size:3.0rem; font-weight:200; color: #fff;text-decoration: none;">&times;</span></a>
    </div>
    <div style="height:30px;"></div>
    <c:choose>
        <c:when test="${0 ne 0}">
            <div id="login-module-negative__mobile" class="text-center" style="background: #ddd; padding:20px 0;">
                <span style="font-size:0.8rem;">비회원으로 활동하거나<br><a href="#">로그인</a>하세요.</span>
            </div>
        </c:when>
        <c:otherwise>
            <div id="login-module__mobile" style="background: #ddd; height:75px; padding:10px;">
                <div id="login-module__mobile__avatar" style="float:left;">
                    <img src="../../../resources/imgs/margarette.png"
                         width="50px" height="auto" style="border-radius:9999px;">
                </div>
                <div id="login-module__mobile__idnick" style="float:left; overflow:hidden; padding-left:5px; padding-top:5px;">
                    <span style="font-size:0.9rem; line-height: 15px;"><strong>마가렛트</strong>&nbsp;(margarette)</span>
                    <div id="login-module__mobile__icon-wrapper">
                        <span class="login-module__idnick__icon" style="font-size:0.6rem !important; border:none; padding:1px 5px; border-radius:4px;
                     background:crimson; color:#fff; display:inline-block !important;">Lv.273</span>
                            <%--<span class="login-module__idnick__icon"  style="font-size:0.6rem !important; border:none; padding:1px 5px; border-radius:4px; background:deepskyblue; color:#fff; display:inline-block !important;">유리천장</span>--%>
                        <span class="login-module__idnick__icon"  style="font-size:0.6rem !important; border:none; padding:1px 5px; border-radius:4px;
                     background:orange; color:#fff; display:inline-block !important;">겜창인생</span>
                        <span class="login-module__idnick__icon"  style="font-size:0.6rem !important; border:none; padding:1px 5px; border-radius:4px;
                     background:#000; color:#fff; display:inline-block !important;">만세a</span>
                    </div>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
    <ul id="list-filter-vert1" class="list-group">
        <div class="text-center" style="padding:10px 0 5px;">
            <span style="font-size:1rem; color:#fff;">포말게시판</span>
        </div>
        <li class="list-group-item list-menu" data-value="1" onclick="moveByRef(this)">자유게시판</li>
        <li class="list-group-item list-menu" data-value="2" onclick="moveByRef(this)">질문게시판</li>
        <li class="list-group-item list-menu" data-value="3" onclick="moveByRef(this)">익명게시판</li>
        <li class="list-group-item list-menu" data-value="4" onclick="moveByRef(this)">장터게시판</li>
        <li class="list-group-item list-menu" data-value="5" onclick="moveByRef(this)">신고게시판</li>
    </ul>
    <ul id="list-filter-vert2" class="list-group">
        <div class="text-center" style="padding:10px 0 5px;">
            <span style="font-size:1rem; color:#fff;">께임게시판</span>
        </div>
        <li class="list-group-item list-menu" data-value="6" onclick="moveByRef(this)">오버워치</li>
        <li class="list-group-item list-menu" data-value="7" onclick="moveByRef(this)">몬스터헌터:월드</li>
        <li class="list-group-item list-menu" data-value="8" onclick="moveByRef(this)">리그오브레전드</li>
        <li class="list-group-item list-menu" data-value="9" onclick="moveByRef(this)">나와라</li>
    </ul>
    <ul id="list-filter-vert3" class="list-group">
        <div class="text-center" style="padding:10px 0 5px;">
            <span style="font-size:1rem; color:#fff;">투데이윾머</span>
        </div>
        <li class="list-group-item list-menu" data-value="10" onclick="moveByRef(this)">윾게</li>
        <li class="list-group-item list-menu" data-value="11" onclick="moveByRef(this)">스게</li>
        <li class="list-group-item list-menu" data-value="12" onclick="moveByRef(this)">만세a</li>
    </ul>
</div>
<!-- End of 모바일용 스크롤링 메뉴 -->


</body>
</html>
