// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function(){
 var path  = window.location.href;
    path = path.split('/');

    //hide elements
    $('#company-info').hide();


    //check for user or company display if switched checked
    $("#company").change(function(){
      var checked = $("#company").prop("checked");
      // console.log(checked);
      if(checked){
        $("#company-info").show();
        $('#image-upload .file-path-wrapper input').attr('placeholder', 'Company logo');
      }else{
        $("#company-info").hide();
        $('#image-upload .file-path-wrapper input').attr('placeholder', 'Profile Picture');
      }
    })
})
