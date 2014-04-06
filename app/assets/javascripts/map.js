 <link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet-0.7.2/leaflet.css" />
 <script src="http://cdn.leafletjs.com/leaflet-0.7.2/leaflet.js"></script>

function initialize() {

  $(document).ready(function() {

    $.getJSON('/address.json', {}, function(location){

      var map = L.map('map').setView([location[0], location[1]], 14);

    });

  });

};
