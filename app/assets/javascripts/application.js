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

$('.headerControlsWrapperAdmin').click(function() {
     $('.headerControlsWrapperAdmin').toggleClass("admin_open");
});

$(".headerControlsWrapper").click(function() {
     $('.headerControlsWrapper').toggleClass("admin_open");
});

$('textarea').autosize();

$("#change_password_button").click(function () {
  $(".change_password").toggleClass("passchange");
  });
  

});