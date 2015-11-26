$(document).on("ready page:load", function(){
   $(".dropdown-button").dropdown();
    $('.parallax').parallax();
     $(".button-collapse").sideNav();

     var currentLocation = window.location;
     //check for location
     if(window.location.pathname == "/"){
       //hide home button when location is home
      $("#home-button").hide();
      }
     // resize service request form
     if(window.location.pathname.indexOf('new') < 0){
       $('#service-request').removeClass('z-depth-1');
       $('#service-request .input-field').removeClass('col s6 offset-s3');
       $('#service-request .input-field').addClass('col s8 offset-s2');

     }


    //get locations for map icons
    // getLocation();
  });
