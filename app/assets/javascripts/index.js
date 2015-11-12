$(document).ready(function(){
  $(".fancybox").fancybox({
    openEffect	: 'none',
    closeEffect	: 'none'
  });


  $( "h4 a.see-map" ).click(function(evt) {
    event.preventDefault();
    var infraction_id = $(this).data().infractionId;
    $("#map_canvas_" + infraction_id).toggle();
    var init_map = "initialize_" + infraction_id;
    window[init_map]();
  });
});
