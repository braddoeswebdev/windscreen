//= require jquery
//= require jquery_ujs
//= require private_pub

var targetScreen = "#spareScreen";
var path = "";
var old = "";
var flashing = false;

function resizeScreen(x, y) {
    $('#screen').css({height: y, width: x});
}

function setContent(url) {
    if(old != url){
        path = url;
        $(targetScreen).attr('src', url);
        $(targetScreen).load(transition);
        if(targetScreen == "#screen") {targetScreen = "#spareScreen";}else{targetScreen = "#screen"; }
    }
}

function transition() {
    if(old != path) {
        if(targetScreen == "#screen") {
            $('#container').animate({top: '-=96'}, 200);
            $("#scr").html(path);
        }else{
            $('#container').animate({top: '+=96'}, 200);
            $('#spar').html(path)
        }
        $('#target').html(targetScreen);
        old = path;
    }
}

function panicRefresh() {
    location.reload();
}


function doFlash(target) {
    if(!flashing) {
        flashing = true;
        $('#flasher').attr('src', target);
        $('#flasher').animate({left: '-=240px'}, 50).delay(3000).animate({left: '+=240px'}, 50);
        flashing = false;
    }
}

