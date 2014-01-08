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

$('#headerOverview').click(function() {
     window.location.href='/tasks';
});
$('#headerIssuesOverview').click(function() {
     window.location.href='/issues';
});
$('#adminheaderIssuesOverview').click(function() {
     window.location.href='/admin_issue_index';
});
$('#headerAccountModify').click(function() {
     window.location.href='/users/edit';
});
$('#headerHospitalIndex').click(function() {
     window.location.href='/admin_view';
});
$('#headerMasterTask').click(function() {
     window.location.href='/admin_task_overview';
});
$('#headerEnrollHospital').click(function() {
     window.location.href='/users/sign_up';
});
$('#logo').click(function() {
     window.location.href='/users/edit';
});
$('#headerSignOut').click(function() {
     window.location.href='/users/sign_out';
});
$('#headerHelp').click(function() {
     window.location.href='/pages/help';
});

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

$("#change_password_button").click(function () {
  $(".change_password").toggleClass("passchange");
  });
  

});