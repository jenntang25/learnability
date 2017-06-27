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
//= require_tree ./app


// $(function(){
// $('#Leisure-content').addClass('fa-glass');
//     $('#Sports-content').addClass('fa-life-ring ');
//     $('#Photography-content').addClass('fa-camera-retro');
//     $('#Programming-content').addClass('fa-puzzle-piece');
//     $('#Languages-content').addClass('hide');
//     $('#Cooking-content').addClass('fa-cutlery ');
//     $('#Entertainment-content').addClass('fa-glass ');
//     $('#Art-content').addClass('hide');
//     $('#Other-content').addClass('hide');
//   });

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



