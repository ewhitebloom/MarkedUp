  function onMapClick(e) {
    var popup = L.popup();
    popup
    .setLatLng(e.latlng)
    .setContent("You clicked the map at " + e.latlng.toString())
    .openOn(map);
  };

  function retrievePosts() {
  };

  function initialize() {

    $.getJSON('/address.json', {}, function(location){

      var coordinates = [parseFloat(location[0]),parseFloat(location[1])];

      var map = L.map('map').setView(coordinates, 14);

      L.tileLayer('http://{s}.tile.cloudmade.com/8ee2a50541944fb9bcedded5165f09d9/997/256/{z}/{x}/{y}.png', {
        attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>',
        maxZoom: 18
      }).addTo(map);

      var marker = L.marker(coordinates).addTo(map);

      retrievePosts();

      onMapClick(e);

    });

  };
