var category = function(){
    var url = new URL(window.location.href);
    return url.pathname.split("/c")[1].split("/p")[0];
};
console.log(category());

var tmp = 0, tmpNum = 0;

$(function(){
    $('#list-filter1 .list-menu').each(function(){
        if($(this).attr('data-value') == category) {
            $(this).removeClass('list-menu').addClass('list-menu-selected');
            tmp = $(this).text();
            tmpNum = $(this).attr('data-value');
        }
    });

    $('#list-filter2 .list-menu').each(function(){
        if($(this).attr('data-value') == category) {
            $(this).removeClass('list-menu').addClass('list-menu-selected');
            tmp = $(this).text();
            tmpNum = $(this).attr('data-value');

        }
    });

    $('#list-filter3 .list-menu').each(function(){
        if($(this).attr('data-value') == category) {
            $(this).removeClass('list-menu').addClass('list-menu-selected');
            tmp = $(this).text();
            tmpNum = $(this).attr('data-value');

        }
    });

    $('#list-filter-vert1 .list-menu').each(function(){
        if($(this).attr('data-value') == category) {
            $(this).removeClass('list-menu').addClass('list-menu-selected');
            tmp = $(this).text();
            tmpNum = $(this).attr('data-value');
        }
    });

    $('#list-filter-vert2 .list-menu').each(function(){
        if($(this).attr('data-value') == category) {
            $(this).removeClass('list-menu').addClass('list-menu-selected');
            tmp = $(this).text();
            tmpNum = $(this).attr('data-value');

        }
    });

    $('#list-filter-vert3 .list-menu').each(function(){
        if($(this).attr('data-value') == category) {
            $(this).removeClass('list-menu').addClass('list-menu-selected');
            tmp = $(this).text();
            tmpNum = $(this).attr('data-value');

        }
    });

    if(tmpNum == 6){
        $('.board-banner-img').attr('src', '../../../resources/imgs/overwatch_ge.jpg');
    }else if(tmpNum == 7){
        $('.board-banner-img').attr('src', '../../../resources/imgs/mhw_ge.jpg');
    }else if(tmpNum == 8){
        $('.board-banner-img').attr('src', '../../../resources/imgs/lol_ge.jpg');
    }else if(tmpNum == 9){

    }

    console.log(tmp + ' / ' + tmpNum)

    // history.pushState(null, null, location.href);
    // window.onpopstate = function(event) {
    //     history.go(1);
    // };
    $('#board-name').text(tmp);
});

function moveByRef(data){
    var idx = data.getAttribute('data-value');
    window.location.replace('/board/c' + idx);
}

// When the user scrolls down 20px from the top of the document, show the button
// window.onscroll = function() {scrollFunction()};
//
// function scrollFunction() {
//     if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
//         document.getElementById("myBtn").style.display = "block";
//     } else {
//         document.getElementById("myBtn").style.display = "none";
//     }
// }
//
// // When the user clicks on the button, scroll to the top of the document
// function topFunction() {
//     document.body.scrollTop = 0;
//     document.documentElement.scrollTop = 0;
// }

$.wait = function(ms) {
    var defer = $.Deferred();
    setTimeout(function() { defer.resolve(); }, ms);
    return defer;
};

function verticalScrollMenu(){
    $('#menu-view-verticalScroll').removeClass('slideOutLeft').addClass('slideInLeft');
    function doTask(){
        document.getElementById("shadow").style.display = "block";
        document.getElementById("menu-view-verticalScroll").style.display = "block";
        document.getElementById("vertical-scrollBtn").style.display = "none";
        // document.getElementById("mobile-scroll-prevent").style.overflowY = "hidden";
    }
    $.wait(10).then(doTask);
}

function verticalScrollRestore(){
    $('#menu-view-verticalScroll').removeClass('slideInLeft').addClass('slideOutLeft');
    function doTask() {
        document.getElementById("shadow").style.display = "none";
        document.getElementById("menu-view-verticalScroll").style.display = "none";
        document.getElementById("vertical-scrollBtn").style.display = "block";
        // document.getElementById("mobile-scroll-prevent").style.overflowY = "initial";
    }
    $.wait(10).then(doTask);
}

/** DOWN */

/*
    $(function(){
        var jqxhr = $.getJSON('../../../resources/json/board_category.json', function() {
            console.log( "success" );
        }).done(function() {
            console.log( "second success" );
        }).fail(function() {
            console.log( "error" );
        }).always(function() {
            console.log( "complete" );
        });

        // Perform other work here ...
        console.log(jqxhr.responseText);
        // Set another completion function for the request above
    });
    // var data = $.getJSON('../../../resources/json/board_category.json');
    // var aka = array[category()-1].aka;
    // console.log(array[1].aka);
    // console.log(aka);
    */


var width = $(window).width();
var height = $(window).height();
$(window).on('resize', function(){
    if($(this).width() != width){
        // width = $(this).width();
        // console.log(width);
        var localTmpWidth = $('#login-module-avatar').width();
        $('#login-module-avatar').attr('height', localTmpWidth + "px");
    }
});
$(window).on('resize load', function(){
    $('#pc-whole-wrapper').css('height', (height * 0.8) );
});

$(function(){
    var imgResize = document.getElementsByTagName( 'img' )[0]; // '0' to assign the first (and only `HTML` tag)
    imgResize.className += 'img-fluid';

    // history.pushState(null, null, location.href);
    // window.onpopstate = function(event) {
    //     history.go(1);
    // };
});
var deleteArticle = function(num){
    if(confirm('정말로 삭제하시겠습니까?\n한번 삭제된 내용은 복구할 수 없습니다!')){
        return true;
    }else{
        return false;
    }
}