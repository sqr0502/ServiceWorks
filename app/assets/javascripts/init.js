$(document).on("ready page:load", function(){
  //url location  variable
  var location = window.location.pathname.split('/');

    // Materialize functions
    $(".dropdown-button").dropdown();
    $('.parallax').parallax();
    $(".button-collapse").sideNav();


      //check to for home link
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
     // location url object
     var currentLocation = window.location;
     //get quote count based on type
     if(location.indexOf('users') > 0 && location.indexOf('service_requests') > 0 ){
      $.get(currentLocation.pathname + '.json', function(data){

        var open = data.filter(function(r) {return r.status == "Open"});
        var quoted = data.filter(function(r){return r.status == "Quoted"});
        var progress = data.filter(function(r){return r.status == "In Progress"});
        // var completed = data.filter(function(r){return r.status == "Completed"})

        // $("#active-orders").append('<span class="badge green black-text">'+completed.length+' Completed</span>');
        $("#active-orders").append('<span class="badge blue black-text">'+open.length+' Open</span>');
        $("#active-orders").append('<span class="badge yellow black-text">'+quoted.length+' Quoted</span>');
        $("#active-orders").append('<span class="badge orange black-text">'+progress.length+' In Progress</span>');
      })
     }

     //reviews and quote pages

    //check path for service request number
    if(location.indexOf('service_requests') && parseInt(location[location.length - 1]) > 0 ){
      var reviews = $('#reviews'); //if there is reviews
      var reviewBox=$('#review'); //for user to write a review
      var slider=$('.slider');
      var details=$('#details');
      var actions=$('#actions');
      var quote = $('#quote'); //for svcr to submit quote


      //set size of review box and reviews list accordingly
      //checking to see if reviews exist and then modify layout
      if(reviews[0].children.length > 0){
        reviews.addClass('col s12');
        // reviews.removeClass('m6');
        details.append(reviews);
        details.addClass('m6');
        slider.addClass('m6');
        quote.removeClass('m6');
      }
      if(actions[0].children.length > 0){
        console.log(actions[0].children);
         actions.addClass("row")
        //  actions[0].children.addClass("col m6 s12");
         quote.removeClass('m6')
         quote.prepend(actions);
      }
    }

     //navbar color change
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

     //if not home then navbar is solid
    if(location.length > 2){
       console.log("location", location)
      //simply set the color of the navbar
      $('nav').addClass('light-green');
    }

     // image slider for customer uploaded images
     $('.slider').slider({full_width: true});

  });
