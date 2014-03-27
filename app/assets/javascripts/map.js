function initialize() {

  $(document).ready(function() {

    $.getJSON('/address.json', {}, function(location){

      var map = L.map('map').setView([location[0], location[1]], 14);

    });

  });

};
