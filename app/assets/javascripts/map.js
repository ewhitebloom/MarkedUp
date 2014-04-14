var map;
var popup = L.popup( { minWidth: 150 } );

function initializeMap() {

  $.getJSON('/address.json', {}, function(location){

    var coordinates = [location[0],location[1]];

    map = L.map('map').setView(coordinates, 16);

    L.tileLayer('http://{s}.tile.cloudmade.com/8ee2a50541944fb9bcedded5165f09d9/997/256/{z}/{x}/{y}.png', {
      attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>',
      maxZoom: 22
    }).addTo(map);

    L.circle(coordinates, 1609.34, { fill: false }).addTo(map);

    var currentLocation = L.icon({
    iconUrl: '/assets/currentlocation.png',
    });

    var marker = L.marker(coordinates, {icon: currentLocation}).addTo(map);

    retrievePosts();

    map.on('click', makePost);
  });
};

function makePost(e) {
  var $mapform = $('#mapform');

  var lat = e.latlng.lat;
  var lng = e.latlng.lng;

  popup
    .setLatLng(e.latlng)
    .setContent($mapform.html())
    .openOn(map);

  $('#map').unbind();

  $('#map').on('submit', 'form', function(event) {
    event.preventDefault();

    var $form = $(event.currentTarget);
    var data = $form.serialize() + '&' +
      $.param({ post: { latitude: lat, longitude: lng } } );

    $.ajax({
      type: $form.attr('method'),
      url: $form.attr('action'),
      data: data,
      dataType: 'json',
      success: function(){
        $form.prepend('Post Successful!').hide().fadeIn();
         retrievePosts();
         map.closePopup();
      },
      error: function(){
        $form.prepend('Something went wrong. Try Again.').hide().fadeIn();
      }
    });
  });
};

function vote(){};

function retrievePosts() {
  $.getJSON('/posts.json', {}, function(data){
     $.each(data, function(i,post){

       var redMarker = L.AwesomeMarkers.icon({
         markerColor: 'red'
       });

       var marker = L.marker([post.latitude, post.longitude], { icon:redMarker }).addTo(map);

       var content = "<div class='post_category'><strong>" + post.category + "</strong></div>" + "<div class='post_body'>" + post.body + "</div>";
       marker.bindPopup(content);
    });
  });
}
