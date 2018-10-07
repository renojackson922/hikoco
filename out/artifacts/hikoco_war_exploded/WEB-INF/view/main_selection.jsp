<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Title</title>
    <%@ include file="./essential/base.jsp"%>
    <%--<link href="../../resources/script/ghostcss.css" rel="stylesheet" crossorigin="anonymous">--%>
    <style>
        #main{
            width:900px;
            height:100%;
            margin:0 auto;
            padding:50px 0 50px 0;
        }
        #main-title > span{
            display:block;
        }
        #main-content{
            padding: 50px;
        }
        #main-content__button{
            /*border:1px solid #5d5d5d;*/
            height:390px;
        }
        .main-content__button{
            float:left;
            width:50%;
            height:100%;
        }
        .main-content__button_item{
            border:1px solid #5d5d5d;
            height: calc(100% - 30px);
            width: calc(100%- 30px);
            margin:15px;
        }
        .item-prop{
            margin:0 auto;
            padding-top:33%;
        }
        .item-prop > span{
            display:block;
        }
        .unselectable{
            user-select: none;
            -moz-user-select: none;
            -khtml-user-select: none;
            -webkit-user-select: none;
            -o-user-select: none;
        }
        #type-a:hover{
            border:2px solid crimson;
        }
        #type-b:hover{
            border:2px solid deepskyblue;
        }

        /*
        #type-a:focus, #type-a:active{
            border:0px;
            background: crimson;
        }
        #type-b:focus, #type-b:active{
            border:0px;
            background: deepskyblue;
        }
        #type-a:focus-within{
            color:#fff;
        }
        */
    </style>
</head>
<body>
<div id="show">
    <div id="main" class="text-center">
        <div id="main-title">
            <span style="font-size:2.5rem; font-weight:300;">실크독 사이트맵</span>
            <span style="font-size:0.9rem; font-weight:400;">클릭하면 해당 사이트로 이동합니다</span>
        </div>
        <div id="main-content">
            <div id="main-content__button">
                <div class="main-content__button">
                    <div id="type-a" class="main-content__button_item unselectable" onclick="location.href='/shop'">
                        <div class="item-prop">
                            <span style="font-size:2.5rem; font-weight:300;">HIKOCO</span>
                            <span style="font-size:1.5rem; font-weight:400; color:crimson;">
                                <i class="far fa-arrow-alt-circle-left"></i>&nbsp;이동하기
                            </span>
                        </div>
                    </div>
                </div>
                <div class="main-content__button">
                    <div id="type-b" class="main-content__button_item unselectable" onclick="location.href='/board'">
                        <div class="item-prop">
                            <span style="font-size:2.5rem; font-weight:300;">Simpleboard</span>
                            <span style="font-size:1.5rem; font-weight:400; color:deepskyblue;">
                                이동하기&nbsp;<i class="far fa-arrow-alt-circle-right"></i>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
