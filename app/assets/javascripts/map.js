function initialize() {

  $(document).ready(function() {

    $.getJSON('/address.json', {}, function(location){

      var coordinates = [parseFloat(location[0]),parseFloat(location[1])];

      var map = L.map('map').setView(coordinates, 11);

    });

  });

};
