// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap
//= require ckeditor/init
//= require rails-ujs
//= require turbolinks
//= require_tree .

$(function(){
	var a = $("div[class*='alert']");
	a.css({ opacity: 1 });
	a.fadeIn().delay(5000).fadeOut();
});

$(document).ready(function(){
 $('.image').on('change', function(event) {
    var a = $(this).parent().find("div#image")
    var files = event.target.files;
    var image = files[0]
    console.log(image.size);
    var reader = new FileReader();
    reader.onload = function(file) {
      var img = new Image();
      img.src = file.target.result;
      $(a).html(img);
    }
    reader.readAsDataURL(image);
  });
});
