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

     if(currentLocation.pathname.indexOf('users') > 0 && currentLocation.pathname.indexOf('service_requests') > 0 ){
      $.get(currentLocation.pathname + '.json', function(data){
        console.log(data);
        var open = data.filter(function(r) {return r.status == "Open"});
        var quoted = data.filter(function(r){return r.status == "Quoted"});
        $("#active-orders").append('<span class="badge green black-text">'+open.length+' Open</span>');
        $("#active-orders").append('<span class="badge yellow black-text">'+quoted.length+' Quoted</span>');
      })

      //set delete links for quote details

     }

     // image slider for customer uploaded images
    $('.slider').slider({full_width: true});



    //get locations for map icons
    // getLocation();
  });
