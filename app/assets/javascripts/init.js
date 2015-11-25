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
