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
	
setTimeout(function(){$(".notice, .alert").css({"opacity" : "1", "top" : "10px"});}, 300);	
setTimeout(function(){$(".notice, .alert").css({"opacity" : "0", "top" : "-10px"});}, 3500);

$('#overviewIcon').click(function() {
     window.location.href='/tasks';
});
$('#issuesIcon').click(function() {
     window.location.href='/issues';
});
$('#accountModifyIcon').click(function() {
     window.location.href='/users/edit';
});
$('#signOutIcon').click(function() {
     window.location.href='/users/sign_out';
});

      if(window.location.href.indexOf("tasks") > -1) {
        $("#headerOverview").css({"background-color" : "rgba(105,157,200, 1)"});
    }
      if(window.location.href.indexOf("issues") > -1) {
        $("#headerIssuesOverview").css({"background-color" : "rgba(127,0,255, 1)"});
    }
      if(window.location.href.indexOf("users") > -1) {
        $("#headerAccountModify").css({"background-color" : "rgba(72,189,160, 1)"});
    }

$('textarea').autosize();

$("#change_password_button").click(function () {
  $(".change_password").toggleClass("passchange");
  });
  

});