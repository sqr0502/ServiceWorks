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

     //get quote count based on type
     if(currentLocation.pathname.indexOf('users') > 0 && currentLocation.pathname.indexOf('service_requests') > 0 ){
      $.get(currentLocation.pathname + '.json', function(data){
        console.log(data);
        var open = data.filter(function(r) {return r.status == "Open"});
        var quoted = data.filter(function(r){return r.status == "Quoted"});
        $("#active-orders").append('<span class="badge green black-text">'+open.length+' Open</span>');
        $("#active-orders").append('<span class="badge yellow black-text">'+quoted.length+' Quoted</span>');
      })
     }

     //navbar color change
     var path = currentLocation.pathname;
     var navbarPos = 600;
     var mobile = false;
     //check for mobile
     if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
      navbarPos = 400;
      mobile = true;
      //remove parallax
      $('.parallax img').css('width', '100%');
      $('.parallax img').removeClass('parallax');
      $('nav').addClass('light-green');
      $('.valign-wrapper').addClass('center-align');
      $('.valign-wrapper').removeClass('valign-wrapper');

     }

     // check path is home
     if(path == "/" && !mobile){
       $(window).scroll(function (event) {
            var scroll = $(window).scrollTop();
            // check window position
            if(scroll > navbarPos){
                $('nav').addClass('light-green');
            }else{
                $('nav').removeClass('light-green');
            }
            // Do something
       });

     }else{
      //simply set the color of the navbar
      $('nav').addClass('light-green');
     }

     // image slider for customer uploaded images
    $('.slider').slider({full_width: true});




    //get locations for map icons
    // getLocation();
  });
