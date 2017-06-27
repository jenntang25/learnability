//= require jquery
//= require jquery_ujs
//= require jquery-fileupload/basic
//= require cloudinary/jquery.cloudinary
//= require attachinary
//= require bootstrap-sprockets
//= require underscore
//= require gmaps/google
//= require moment
//= require bootstrap-datetimepicker
//= require datetimepicker
//= require jquery.raty
//= require_tree ./app

$(function(){

  $(".tab").on("click", function(e){
    event.preventDefault();
    // Change active tab
    // Hide all tab-content (use class="hidden")
    $( ".tab" ).removeClass("active");

    $(this).addClass("active");
    // Show target tab-content (use class="hidden")


    $(".tab-content").addClass("hidden");

    id_of_tab = $(this).data("target");

    $(id_of_tab).removeClass("hidden");

  });
});



