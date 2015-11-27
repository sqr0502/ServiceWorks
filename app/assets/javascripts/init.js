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
    getLocation();
  });








///Map functions ===========================================

// global map object
var map;

// getting location into an addrees TODO:implement address addition dynamic
function getLocation(){
 $.get("https://maps.googleapis.com/maps/api/geocode/json?address=90210",loadMarkers);
}

// initialize map, centered on US
function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    scrollwheel: false,
    center: {lat: 39.5, lng: -98.583},
    zoom: 4
  });
  getLocation();

}

// add markers to map
function loadMarkers(response){

  var myLatLng = response.results[0].geometry.location;
  var title = response.results[0].formatted_address;

// create marker pass options
  var marker = new google.maps.Marker({
      position: myLatLng,
      map: map,
      title: title,
      icon: "http://maps.google.com/mapfiles/ms/icons/pink-dot.png"
    });

addInfo(marker, response.results[0]);

}

// add infowindow after marker has been added
function addInfo(marker, data){

  var contentString = '<div id="content">'+
      '<div id="siteNotice">'+
      '</div>'+
      '<h1 id="firstHeading" class="firstHeading">'+ data.address_components[0].short_name + '</h1>'+
      '<div id="bodyContent">'+
      '<p><b>'+ marker.title + '</b></p>'+
      '</div>'+
      '</div>';

// creates infowindow for marker location
  var infowindow = new google.maps.InfoWindow({
    content: contentString
  });

// event listener for marker
    marker.addListener('click', function() {
     infowindow.open(map, marker);
   });
}
