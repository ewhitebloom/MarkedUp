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

    var marker = L.marker(coordinates, { icon: currentLocation }).addTo(map);

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

function vote(post_id){
  $.ajax({
    type: 'POST',
    dataType: 'json',
    url: '/posts/' + post_id + '/votes.json',
    success: function(){
       retrievePosts();
       map.closePopup();
    },
    error: function(){
      alert('Vote Failed. Please Try Again.');
    }
  });
};

function retrievePosts() {
  $.getJSON('/posts.json', {}, function(data){
     $.each(data, function(i,post){

       var redMarker = L.AwesomeMarkers.icon({
         markerColor: 'red'
       });

       var darkredMarker = L.AwesomeMarkers.icon({
         markerColor: 'darkred'
       });

       var orangeMarker = L.AwesomeMarkers.icon({
         markerColor: 'orange'
       });

       var greenMarker = L.AwesomeMarkers.icon({
         markerColor: 'green'
       });

       var darkgreenMarker = L.AwesomeMarkers.icon({
         markerColor: 'darkgreen'
       });

       var blueMarker = L.AwesomeMarkers.icon({
         markerColor: 'blue'
       });

       var purpleMarker = L.AwesomeMarkers.icon({
         markerColor: 'purple'
       });

       var darkpurpleMarker = L.AwesomeMarkers.icon({
         markerColor: 'darkpurple'
       });

       var cadetblueMarker = L.AwesomeMarkers.icon({
         markerColor: 'cadetblue'
       });

       var transportation = L.AwesomeMarkers.icon({
         markerColor: 'darkred',
         icon: 'fa-truck'
       });

       var government = L.AwesomeMarkers.icon({
         markerColor: 'cadetblue',
         icon: 'flag'
       });

       var other = L.AwesomeMarkers.icon({
         markerColor: 'darkpurple',
         icon: 'bookmark'
       });

       var marker_assign = { 'News': redMarker, 'Event': orangeMarker, 'Personal':purpleMarker, 'Parks/Public\ Works': darkgreenMarker, 'Entertainment': cadetblueMarker, 'Shops':darkpurpleMarker, 'Restaurants': blueMarker, 'Neighborhood': darkredMarker, 'Transportation': transportation, 'Government': government, 'Other': other }

       var marker = L.marker([post.latitude, post.longitude], { icon: marker_assign[post.category] }).addTo(map);

       var content = "<div class='post_category'><strong>" + post.category + "</strong></div>" + "<div class='post_body'>" + post.body + "</div>" + "<div class='post_votes'>" + post.count + "</div>" + "<a href='#'  class='button tiny radius round'' onclick='vote(" + post.id + ");'>Vote</a>";
       marker.bindPopup(content);
    });
  });
}
