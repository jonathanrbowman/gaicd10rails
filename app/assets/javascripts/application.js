// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require turbolinks
//= require_tree .
//= require jquery.spin

$(document).ready(function() {
	
setTimeout(function(){$(".notice, .alert").css({"opacity" : "1", "top" : "0"});}, 300);	
setTimeout(function(){$(".notice, .alert").css({"opacity" : "0", "top" : "-60px"});}, 4000);

      if(window.location.href.indexOf("tasks") > -1) {
        $("#headerOverview").css({"background-color" : "rgba(105,157,200, 1)"});
        $("#headerMasterTask").css({"background-color" : "rgba(105,157,200, 1)"});
        $(".headerControlsWrapper").css({"border-right" : "10px solid rgba(105,157,200, 1)"});
        
    }
      if(window.location.href.indexOf("issues") > -1) {
        $("#headerIssuesOverview").css({"background-color" : "rgba(127,0,255, 1)"});
        $(".headerControlsWrapper").css({"border-right" : "10px solid rgba(127,0,255, 1)"});
    }
      if(window.location.href.indexOf("users/edit") > -1) {
        $("#headerAccountModify").css({"background-color" : "rgba(72,189,160, 1)"});
        $(".headerControlsWrapper").css({"border-right" : "10px solid rgba(72,189,160, 1)"});
    }
      if(window.location.href.indexOf("admin_view") > -1 || window.location.href.indexOf("admin_detail") > -1) {
        $("#headerHospitalIndex").css({"background-color" : "#E59661"});
        $(".headerControlsWrapper").css({"border-right" : "10px solid #E59661"});
    }
    
      if(window.location.href.indexOf("admin_task_overview") > -1 || window.location.href.indexOf("tasks/new") > -1) {
        $("#headerMasterTask").css({"background-color" : "rgba(105,157,200, 1)"});
        $(".headerControlsWrapper").css({"border-right" : "10px solid rgba(105,157,200, 1)"});
    }
      if(window.location.href.indexOf("users/sign_up") > -1) {
        $("#headerEnrollHospital").css({"background-color" : "#6EBE52"});
        $(".headerControlsWrapper").css({"border-right" : "10px solid #6EBE52"});
    }
      if(window.location.href.indexOf("admin_issue_index") > -1) {
        $("#adminheaderIssuesOverview").css({"background-color" : "rgba(127,0,255, 1)"});
        $(".headerControlsWrapper").css({"border-right" : "10px solid rgba(127,0,255, 1)"});
    }
      if(window.location.href.indexOf("pages/help") > -1) {
        $("#headerHelp").css({"background-color" : "rgba(242,198,80, 1)"});
        $(".headerControlsWrapper").css({"border-right" : "10px solid rgba(242,198,80, 1)"});
    }

$('textarea').autosize();
  
$('#home_table_1').hover(
    function () {
        $("#home_row_1").css({"border" : "4px solid rgb(105, 157, 200)"});
        $("#home_page_table_icon_1").css({"background-color" : "rgb(105, 157, 200)"});
        $("#home_page_table_icon_link_1").css({"background-color" : "rgb(105, 157, 200)"});
    }, 
    function () {
        $("#home_row_1").css({"border" : "4px solid #444444"});
        $("#home_page_table_icon_1").css({"background-color" : "#444444"});
        $("#home_page_table_icon_link_1").css({"background-color" : "#444444"});
    }
);

$("#home_table_1").click(function () {
	  $("#home_row_1").toggleClass("home_row_active");
	  $("#home_page_table_icon_1").toggleClass("home_page_table_icon_active");
	  $("#home_page_table_icon_link_1").toggleClass("home_page_table_icon_link_active");
  });
  
  $('#home_table_2').hover(
    function () {
        $("#home_row_2").css({"border" : "4px solid rgb(105, 157, 200)"});
        $("#home_page_table_icon_2").css({"background-color" : "rgb(105, 157, 200)"});
        $("#home_page_table_icon_link_2").css({"background-color" : "rgb(105, 157, 200)"});
    }, 
    function () {
        $("#home_row_2").css({"border" : "4px solid #444444"});
        $("#home_page_table_icon_2").css({"background-color" : "#444444"});
        $("#home_page_table_icon_link_2").css({"background-color" : "#444444"});
    }
);

$("#home_table_2").click(function () {
	  $("#home_row_2").toggleClass("home_row_active");
	  $("#home_page_table_icon_2").toggleClass("home_page_table_icon_active");
	  $("#home_page_table_icon_link_2").toggleClass("home_page_table_icon_link_active");
  });

  $('#home_table_3').hover(
    function () {
        $("#home_row_3").css({"border" : "4px solid rgb(105, 157, 200)"});
        $("#home_page_table_icon_3").css({"background-color" : "rgb(105, 157, 200)"});
        $("#home_page_table_icon_link_3").css({"background-color" : "rgb(105, 157, 200)"});
    }, 
    function () {
        $("#home_row_3").css({"border" : "4px solid #444444"});
        $("#home_page_table_icon_3").css({"background-color" : "#444444"});
        $("#home_page_table_icon_link_3").css({"background-color" : "#444444"});
    }
);

$("#home_table_3").click(function () {
	  $("#home_row_3").toggleClass("home_row_active");
	  $("#home_page_table_icon_3").toggleClass("home_page_table_icon_active");
	  $("#home_page_table_icon_link_3").toggleClass("home_page_table_icon_link_active");
  });

$(".home_contact_us_button").click(function () {
  $("#home_contact_form_wrapper").toggleClass("home_contact_form_wrapper_expanded");
  });
  
$("#home_email_submit").click(function () {
  $("#home_contact_form_confirmation").css({"display" : "block"});
  setTimeout(function(){$("#home_contact_form_confirmation").css({"opacity" : "1"});}, 100);
  setTimeout(function(){$("#home_contact_form_confirmation").css({"opacity" : "0"});}, 2000);
  setTimeout(function(){$("#home_contact_form_confirmation").css({"display" : "none"});}, 2100);
  });

$("#change_password_button").click(function () {
  $(".change_password").toggleClass("passchange");
  });
  

});