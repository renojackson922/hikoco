<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>당신 삶의 모든 순간이 영화입니다.</title>
    <link rel="stylesheet" type="text/css" href="gg.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <style type="text/css">
        #fi {
            width:500px;
            height:100px;
            position:relative;
            left:32%;
            line-height:30px;
        }
        #seat > span{
            display: block;
        }
        label{
            font-size:0.9em;
        }
        .form-group{
            margin: 3px 0 3px 0;
        }
    </style>
</head>

<body>
<header class="header">
    <div class="container">
        <h1 class="logo">영화공간</h1>
        <ul class="nav">
            <li><a href="main.html">홈</a></li>
            <li><a href="intro.html">경험을 선물합니다</a></li>
            <li><a href="screen.html">이달의 상영</a></li>
            <li><a href="seminar.html">세미나·교육</a></li>
            <li><a href="office.html">비즈니스 센터</a></li>
        </ul>
    </div>
</header>

<div class="container">
    <form id="form1" method="POST" action="form_app.js" style="width:70%; margin:0 auto;">
        <span style="font-size:1em; display:block;"><strong>5월 영화 예매하기</strong></span>
        <!-- 영화 제목 -->
        <div class="form-group">
            <label for="movie">영화:&nbsp;</label>
            <select class="form-control" id="movie" name="movie" size="1" id="title">
                <option>파수꾼(2주차)</option>
                <option>인생(3주차)</option>
                <option>블루발렌타인(4주차)</option>
            </select>
        </div>
        <!-- 영화 예매자 -->
        <div class="form-group">
            <label for="res_name">예매자:&nbsp;</label>
            <input type="text" class="form-control" id="res_name" name="res_name" required>
        </div>
        <!-- 예매자 연락처 -->
        <div class="form-group">
            <label for="phone">휴대폰:&nbsp;</label>
            <input type="tel" class="form-control" name="phone" size="20" id="phone" placeholder="01*-000*-0000" pattern="01[0-9]-[0-9]{3,4}-[0-9]{4}" required>
        </div>
        <!-- 예매 인원 -->
        <div class="form-group">
            <label for="amount">예매인원:&nbsp;</label>
            <select class="sel2" id="amount" name="amount">
                <option value="-1">선택해주세요</option>
                <option value="1">1명</option>
                <option value="2">2명</option>
                <option value="3">3명</option>
                <option value="4">4명</option>
                <option value="5">5명</option>
            </select>&nbsp;&nbsp;
            <!-- 인원수 만큼 티켓비용 계산하는 자바스크립트 -->
            <span id="totalValue" name="totalValue" style="display:inline !important;"></span>
        </div>
        <!-- 일자 선택 -->
        <div class="form-group" style="padding-top:17px;">
            <label for="time1">일자 선택 및 시간 선택:&nbsp;</label>
            <input type="date" id="time1" name="time1" min="2018-05-15">
            <select id="time2" name="time2" size="1">
                <option value="1">AM 07:00 ~ 09:00</option>
                <option value="2">AM 10:00 ~ 12:00</option>
                <option value="3">PM 13:00 ~ 15:00</option>
                <option value="4">PM 16:00 ~ 18:00</option>
                <option value="5">PM 19:00 ~ 21:00</option>
            </select>
        </div>
        <!-- 좌석 선택 -->
        <div id="seat" class="form-group" style="text-align:center;">
            <span style="font-size:1.5em;"><strong>[ ]개의 좌석을 선택해주세요.&nbsp;&nbsp;</strong></span>
            <fieldset style="display:inline-block; margin-top:7px; text-align:center;">
                <span>------------SCREEN--------------</span>
                <div style="display:block;">
                    A
                    <input type="checkbox" name="books" value="A1" id="opti"/>
                    <input type="checkbox" name="books" value="A2" id="opti"/>
                    <input type="checkbox" name="books" value="A3" id="opti"/>
                    <input type="checkbox" name="books" value="A4" id="opti"/>
                    <input type="checkbox" name="books" value="A5" id="opti"/>
                    <input type="checkbox" name="books" value="A6" id="opti"/>
                    &nbsp;
                    <input type="checkbox" name="books" value="A7" id="opti"/>
                    <input type="checkbox" name="books" value="A8" id="opti"/>
                    <input type="checkbox" name="books" value="A9" id="opti"/>
                    <input type="checkbox" name="books" value="A10" id="opti"/>
                    <input type="checkbox" name="books" value="A11" id="opti"/>
                    <input type="checkbox" name="books" value="A12" id="opti"/>
                </div>
                <div style="display:block;">
                    B
                    <input type="checkbox" name="books" value="B1" id="opti"/>
                    <input type="checkbox" name="books" value="B2" id="opti"/>
                    <input type="checkbox" name="books" value="B3" id="opti"/>
                    <input type="checkbox" name="books" value="B4" id="opti"/>
                    <input type="checkbox" name="books" value="B5" id="opti"/>
                    <input type="checkbox" name="books" value="B6" id="opti"/>
                    &nbsp;
                    <input type="checkbox" name="books" value="B7" id="opti"/>
                    <input type="checkbox" name="books" value="B8" id="opti"/>
                    <input type="checkbox" name="books" value="B9" id="opti"/>
                    <input type="checkbox" name="books" value="B10" id="opti"/>
                    <input type="checkbox" name="books" value="B11" id="opti"/>
                    <input type="checkbox" name="books" value="B12" id="opti"/>
                </div>
                <div style="display:block;">
                    C
                    <input type="checkbox" name="books" value="B1" id="opti"/>
                    <input type="checkbox" name="books" value="B2" id="opti"/>
                    <input type="checkbox" name="books" value="B3" id="opti"/>
                    <input type="checkbox" name="books" value="B4" id="opti"/>
                    <input type="checkbox" name="books" value="B5" id="opti"/>
                    <input type="checkbox" name="books" value="B6" id="opti"/>
                    &nbsp;
                    <input type="checkbox" name="books" value="B7" id="opti"/>
                    <input type="checkbox" name="books" value="B8" id="opti"/>
                    <input type="checkbox" name="books" value="B9" id="opti"/>
                    <input type="checkbox" name="books" value="B10" id="opti"/>
                    <input type="checkbox" name="books" value="B11" id="opti"/>
                    <input type="checkbox" name="books" value="B12" id="opti"/>
                </div>
                <div style="display:block;">
                    D
                    <input type="checkbox" name="books" value="B1" id="opti"/>
                    <input type="checkbox" name="books" value="B2" id="opti"/>
                    <input type="checkbox" name="books" value="B3" id="opti"/>
                    <input type="checkbox" name="books" value="B4" id="opti"/>
                    <input type="checkbox" name="books" value="B5" id="opti"/>
                    <input type="checkbox" name="books" value="B6" id="opti"/>
                    &nbsp;
                    <input type="checkbox" name="books" value="B7" id="opti"/>
                    <input type="checkbox" name="books" value="B8" id="opti"/>
                    <input type="checkbox" name="books" value="B9" id="opti"/>
                    <input type="checkbox" name="books" value="B10" id="opti"/>
                    <input type="checkbox" name="books" value="B11" id="opti"/>
                    <input type="checkbox" name="books" value="B12" id="opti"/>
                </div>
            </fieldset>
        </div>

        <p style="text-align:center">
            <button type="button"  onclick="SaveItem()">예매하기</button>
            <input type="reset" value="취소하기"></input></p>
        </fieldset>
        <br>
        <br>
    </form>
</div>

<br>

<form method="post" action="form_app.js">
    <%--<fieldset id="fi">--%>
    <div style="border:1px solid #5d5d5d; border-radius:4px; display:inline-block;" >
        <legend>나의 예매현황</legend>

        <div style="background-color:#d0f0ff; width:600px; height:90px; padding:8px;">
            영화선택: <select id="movieList" style="width:200px" onchange="viewContent()"> </select><br>
            한줄소개: <span id="comment">&nbsp;</span>
            <br><br>
            <input type="button" value="삭제" onclick="RemoveItem()">
            <input type="button" value="전체삭제" onclick="ClearAll()">
        </div>
        <br>
        <div class="wrapper" style="padding:15px;">
            <div>
                <span>영화: </span>
                <span id="movie_disp" name="movie_disp">[]</span>
            </div>
            <div>
                <span>예매자: </span>
                <span id="name_disp" name="name_disp">[]</span>
            </div>
            <div>
                <span>휴대폰: </span>
                <span id="phone_disp" name="phone_disp">[]</span>
            </div>
            <div>
                <span>예매인원: </span>
                <span id="amount_disp" name="amount_disp">[]</span>
            </div>
            <div>
                <span>일자: </span>
                <span id="time1_disp" name="time1_disp">[]</span>
            </div>
            <div>
                <span>시간: </span>
                <span id="time2_disp" name="time2_disp" value="now">[]</span>
            </div>
        </div>


        <p style="text-align:center">
            <button type="button" onclick="location.href='cancel.html'">예매취소하기</button>
            <input type='BUTTON' value="닫기" onClick='self.close();'>
            <button type="button" onclick="viewContent()">예매내역 확인</button>
        </p>
    </div>
    <%--</fieldset>--%>

    <br>
    <br>
</form>

<footer class="footer">
    <br><br><p style="padding-left:37%;font-size:15px">Copyright 2018 (주)영화공간. All rights reserved</p>
</footer>
</body>
<script>
    $(document).ready(function(){
        $('select[class="sel2"]').on('change', function(){
            var get=$('select[class="sel2"] option:selected').val();
            //console.log(get);
            if($('select[class="sel2"] option:selected').val() == -1){
                $('#totalValue').html('')
            }else{
                $('#totalValue').html(get * 9000 + '원');
            }
        });
    });

    // $(function(){
    //
    // });

    var localStorage = window.localStorage;

    var movie = document.getElementById("movie");
    var resName = document.getElementById("res_name");
    var phone = document.getElementById("phone");
    var amount = document.getElementById("amount");
    var time1 = document.getElementById("time1");
    var time2 = document.getElementById("time2");

    var movieDisp = document.getElementById("movie_disp");
    var nameDisp = document.getElementById("name_disp");
    var phoneDisp = document.getElementById("phone_disp");
    var amountDisp = document.getElementById("amount_disp");
    var time1Disp = document.getElementById("time1_disp");
    var time2Disp = document.getElementById("time2_disp");

    /* 자바스크립트에서 해쉬맵 구현 */
    HashMap = function(){
        this.map = new Array();
    };
    HashMap.prototype = {
        put : function(key, value){
            this.map[key] = value;
        },
        get : function(key){
            return this.map[key];
        },
        getAll : function(){
            return this.map;
        },
        clear : function(){
            this.map = new Array();
        },
        isEmpty : function(){
            return (this.map.size() == 0);
        },
        remove : function(key){
            delete this.map[key];
        },
        toString : function(){
            var temp = '';
            for(i in this.map){
                temp = temp + ',' + i + ':' +  this.map[i];
            }
            temp = temp.replace(',','');
            return temp;
        },
        keySet : function(){
            var keys = new Array();
            for(i in this.map){
                keys.push(i);
            }
            return keys;
        }
    };

    if (!localStorage) {
        alert('로컬스토리지를 지원하지 않습니다.');
    }

    if(!localStorage.getItem("cnt")) localStorage.setItem("cnt", 0);

    function pageload() {
        resName.innerHTML = "";
        phone.innerHTML = "";
    }

    function SaveItem() {

        // 배열 순서
        var cntTmp = localStorage.getItem("cnt");
        cntTmp++;
        localStorage.setItem("cnt", cntTmp);

        var map = new HashMap();
        localStorage.removeItem("booking");

        map.put("movie", movie.value);
        map.put("name", resName.value);
        map.put("phone", phone.value);
        map.put("amount", amount.value);
        map.put("time1", time1.value);

        var tmp = time2.value;
        switch (tmp){
            /* regex 변환 필요
            *   : = &#58;
            */
            case '1' : map.put("time2", "AM 07&#58;00 ~ 09&#58;00"); break;
            case '2' : map.put("time2", "AM 10&#58;00 ~ 12&#58;00"); break;
            case '3' : map.put("time2", "PM 13&#58;00 ~ 15&#58;00"); break;
            case '4' : map.put("time2", "PM 16&#58;00 ~ 18&#58;00"); break;
            case '5' : map.put("time2", "PM 19&#58;00 ~ 21&#58;00"); break;
            default : console.log("Something went wrong!"); break;
        }
        localStorage.setItem("booking", map);
        pageload();
    }

    function RemoveItem() {
        var option_value = select.options[select.selectedIndex].value;
        localStorage.removeItem(option_value);
        pageload();
    }

    function ClearAll() {
        localStorage.clear();
        pageload();
    }

    function viewContent() {
        /* 초기화 */
        movieDisp.innerHTML = "";
        nameDisp.innerHTML = "";
        phoneDisp.innerHTML = "";
        amountDisp.innerHTML = "";
        time1Disp.innerHTML = "";
        time2Disp.innerHTML = "";

        var map2 = localStorage.getItem("booking");
        var splice = map2.split(",");

        var result = {};
        for(var i = 0; i < 6; i++){
            result[i] = splice[i].split(":");
            // console.log(result[i][1]);
        }

        movieDisp.innerHTML = result[0][1];
        nameDisp.innerHTML = result[1][1];
        phoneDisp.innerHTML = result[2][1];
        amountDisp.innerHTML = result[3][1];
        time1Disp.innerHTML = result[4][1];
        time2Disp.innerHTML = result[5][1];
    }
</script>
</html>