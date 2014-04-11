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

    var marker = L.marker(coordinates).addTo(map);

    retrievePosts();

    map.on('click', makePost);
  });
};

function makePost(e) {
  var $form = $('#mapform');
  $form.show();

  var lat = e.latlng.lat;
  var lng = e.latlng.lng;

  popup
    .setLatLng(e.latlng)
    .setContent($form.html())
    .openOn(map);

  $('#map').on('submit', 'form', function(event) {
    event.preventDefault();
    var $form = $(event.currentTarget);

    var data = $form.serialize() + '&' +
     $.param({ post: { latitude: lat, longitude: lng } } );
     $.ajax({
        type: "POST",
        url: $form.attr('action'),
        data: data,
        dataType: 'json',
        success: function(){
          $form.prepend('Post Successful!').hide().fadeIn();
          retrievePosts();
        },
        error: function(){
          $form.prepend('Something went wrong. Try Again.').hide().fadeIn();
        }
      });
  });
};

function retrievePosts() {
  $.getJSON('/posts.json', {}, function(data){
     $.each(data, function(i,item){
       var marker = L.marker([item.latitude, item.longitude]).addTo(map);
       var content = "<div class='post_category'>" + item.category + "</div>" + "<div class='post_body'>" + item.body + "</div>";
       marker.bindPopup(content).openPopup();
    });
  });
}
