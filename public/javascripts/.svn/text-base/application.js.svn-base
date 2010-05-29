// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

// Variables
var menu_state = 0 // 0-all closed || 1-full open || 2-group open || 3-related open



function switchit(list){
    var listElementStyle=document.getElementById(list).style;
    if (listElementStyle.display=="none"){
        listElementStyle.display="block";
    }
    else {
        listElementStyle.display="none";
    }
}


/////////////////////////// Full Menu /////////////////////////////////

function pull_full(){
    if (window.drawfull)
        clearInterval(drawfull)
    pullfull=setInterval("pullengine_full()",10)
}
function draw_full(){
    clearInterval(pullfull)
    drawfull=setInterval("drawengine_full()",10)
}
function pullengine_full(){
    themenu=document.getElementById("slidemenubar-full").style
    if (parseInt(themenu.left)<rightboundary)
        themenu.left=parseInt(themenu.left)+10+"px"
    else if (window.pullfull){
        themenu.left=0
        clearInterval(pullfull)
    }
}

function drawengine_full(){
    themenu=document.getElementById("slidemenubar-full").style
    if (parseInt(themenu.left)>leftboundary)
        themenu.left=parseInt(themenu.left)-10+"px"
    else if (window.drawfull){
        themenu.left=leftboundary
        clearInterval(drawfull)
    }
}






/////////////////////////// Group Menu /////////////////////////////////



function pull_group(){
    if (window.drawgroup)
        clearInterval(drawgroup)
    pullgroup=setInterval("pullengine_group()",10)
}
function draw_group(){
    clearInterval(pullgroup)
    drawgroup=setInterval("drawengine_group()",10)
}
function pullengine_group(){
    themenu=document.getElementById("slidemenubar-group").style
    if (parseInt(themenu.left)<rightboundary)
        themenu.left=parseInt(themenu.left)+10+"px"
    else if (window.pullgroup){
        themenu.left=0
        clearInterval(pullgroup)
    }
}

function drawengine_group(){
    themenu=document.getElementById("slidemenubar-group").style
    if (parseInt(themenu.left)>leftboundary)
        themenu.left=parseInt(themenu.left)-10+"px"
    else if (window.drawgroup){
        themenu.left=leftboundary
        clearInterval(drawgroup)
    }
}





/////////////////////////// Related Menu /////////////////////////////////

function pull_related(){
    if (window.drawrelated)
        clearInterval(drawrelated)
    pullrelated=setInterval("pullengine_related()",10)
}
function draw_related(){
    clearInterval(pullrelated)
    drawrelated=setInterval("drawengine_related()",10)
}
function pullengine_related(){
    themenu=document.getElementById("slidemenubar-related").style
    if (parseInt(themenu.left)<rightboundary)
        themenu.left=parseInt(themenu.left)+10+"px"
    else if (window.pullrelated){
        themenu.left=0
        clearInterval(pullrelated)
    }
}

function drawengine_related(){
    themenu=document.getElementById("slidemenubar-related").style
    if (parseInt(themenu.left)>leftboundary)
        themenu.left=parseInt(themenu.left)-10+"px"
    else if (window.drawrelated){
        themenu.left=leftboundary
        clearInterval(drawrelated)
    }
}


/////////////////////////// Working Menus /////////////////////////////////

function work_menus(menu_name){
    thefullmenu=document.getElementById("slidemenubar-full").style
    thegroupmenu=document.getElementById("slidemenubar-group").style
    therelatedmenu=document.getElementById("slidemenubar-related").style
    if (menu_name=="full"){ //is full menu
        if (menu_state==1){
            draw_full()
            thefullmenu.zIndex=0
            menu_state=0
        }
        else{
            if (menu_state==2) {
                draw_group()
                thegroupmenu.zIndex=0
            }
            if (menu_state==3){
                draw_related()
                therelatedmenu.zIndex=0
            }
            pull_full()
            thefullmenu.zIndex=100
            menu_state=1
        }
    }
    else{
        if (menu_name=="related"){ // is related menu
            if (menu_state==3){
                draw_related()
                therelatedmenu.zIndex=0
                menu_state=0
            }
            else{
                if (menu_state==1) {
                    draw_full()
                    thefullmenu.zIndex=0
                }
                if (menu_state==2){
                    draw_group()
                    thegroupmenu.zIndex=0
                }
                pull_related()
                therelatedmenu.zIndex=100
                menu_state=3
            }
        }
        else {  //is group menu
            if (menu_state==2){
                draw_group()
                thegroupmenu.zIndex=0
                menu_state=0
            }
            else{
                if (menu_state==1) {
                    draw_full()
                    thefullmenu.zIndex=0
                }
                if (menu_state==3){
                    draw_related()
                    therelatedmenu.zIndex=0
                }
                pull_group()
                thegroupmenu.zIndex=100
                menu_state=2
            }
        }
    }
}
    //function work_full_menu(){
    //    themenu=document.getElementById("slidemenubar-full").style
    //    if (isfullclosed){
    //        pull_full()
    //        isfullclosed = false
    //        themenu.zIndex=100
    //    }
    //    else{
    //        draw_full()
    //        isfullclosed = true
    //        themenu.zIndex=0
    //    }
    //}
    //
    //
    //function work_group_menu(){
    //    themenu=document.getElementById("slidemenubar-group").style
    //    if (isgroupclosed){
    //        pull_group()
    //        isgroupclosed = false
    //        themenu.zIndex=100
    //    }
    //    else{
    //        draw_group()
    //        isgroupclosed = true
    //        themenu.zIndex=0
    //    }
    //}