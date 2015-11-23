// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function(){
 var path  = window.location.href;
    path = path.split('/');
    if(path.indexOf('users') >= 0 && path.indexOf('service_requests') < 0 ){
      //we do work here
      // $.get(path[path.length -1]+'/service_requests.json', function(data){
      //   console.log(data);
      //   for(var i = 0; i < data.length; i++){
      //     $("#service-requests").append(data[i].id);
      //   }
      // })
    }

    //hide elements
    $('#company-info').hide();


    //check for user or company display if switched checked
    $("#company").change(function(){
      var checked = $("#company").prop("checked");
      // console.log(checked);
      if(checked){
        $("#company-info").show();
      }else{
        $("#company-info").hide();
      }
    })
})
