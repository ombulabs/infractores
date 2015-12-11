$(document).ready(function(){
  var redMarker = 'http://maps.gstatic.com/mapfiles/markers2/marker.png';
  var blueMarker = 'http://maps.gstatic.com/mapfiles/markers2/boost-marker-mapview.png';
  var allMarkers = [];

  $(".fancybox").fancybox({
    openEffect	: 'none',
    closeEffect	: 'none'
  });

  $( "h4 a.see-map" ).click(function(evt) {
    event.preventDefault();
    var infractionId = $(this).data().infractionId;
    $("#map_canvas_" + infractionId).toggle();
    var initMap = "initialize_" + infractionId;
    window[initMap]();
  });

  $( "#info, #close" ).click(function(event) {
    event.preventDefault();
    $("body").toggleClass("overflow");
    $("#description").toggle();
  });

  function resetMapAndPaintMarker(myMarker) {
    $.each(allMarkers, function(i, marker) {
      marker.setIcon(redMarker)
    });
    myMarker.setIcon(blueMarker);
  }

  function scrollToInfraction(infractionDiv) {
    $('html, body').animate({
      scrollTop: $(infractionDiv).offset().top
    }, 300);
  };

  function scrollToPermalinkInfraction() {
    var infraction = window.location.hash;
    if(infraction != "") {
      infraction = infraction.replace("#", "#ver-");
      $(infraction).click();
    }
  }

  function initializeMainMap() {
    var myLatLng = {lat: -34.592894, lng: -58.452826 };
    var mapCanvas = document.getElementById('map_canvas_main');
    var mapOptions = {
      center: myLatLng,
      zoom: 13,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    var map = new google.maps.Map(mapCanvas, mapOptions);
    $.each(infractionMarkers, function(i, markerData) {
      var latitude = parseFloat(markerData[0]);
      var longitude = parseFloat(markerData[1]);
      var infractionDiv = "#infraccion-" + markerData[2];
      var latLng = new google.maps.LatLng(latitude, longitude);
      var marker = new google.maps.Marker({
        map: map,
        position: latLng,
        icon: redMarker
      });
      allMarkers.push(marker);
      google.maps.event.addListener(marker, 'click', function() {
        scrollToInfraction(infractionDiv);
        window.location = "/" + infractionDiv;
        resetMapAndPaintMarker(marker);
      });
      $("#ver-infraccion-" + markerData[2]).click(function(evt) {
        scrollToInfraction(infractionDiv);
        map.panTo(latLng);
        map.setZoom(18);
        resetMapAndPaintMarker(marker);
      });
    });
    scrollToPermalinkInfraction();
  }
  google.maps.event.addDomListener(window, 'load', initializeMainMap);

});
