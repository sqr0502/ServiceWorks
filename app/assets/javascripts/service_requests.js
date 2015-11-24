// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on("ready page:load", function() {
    $('select').material_select();
    
    // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
    $('.review-modal-trigger').leanModal();

});
