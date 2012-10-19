#import('dart:html');
#import('package:js/js.dart', prefix:'js');
#import('package:google_maps/jswrap.dart', prefix:'jsw');
#import('package:google_maps/gmaps.dart', prefix:'gmaps');

void main() {
  js.scoped(() {
    final mapOptions = new gmaps.MapOptions()
      ..zoom = 4
      ..center = new gmaps.LatLng(-25.363882, 131.044922)
      ..mapTypeId = gmaps.MapTypeId.ROADMAP
      ;

    final map = new gmaps.GMap(query("#map_canvas"), mapOptions);

    final marker = new gmaps.Marker(new gmaps.MarkerOptions()
      ..position = map.center
      ..map = map
      ..title = "Click to zoom"
    );

    jsw.retainAll([map, marker]);
    map.on.centerChanged.add(() {
      // 3 seconds after the center of the map has changed, pan back to the marker.
      window.setTimeout(() {
        js.scoped(() {
          map.panTo(marker.position);
        });
      }, 3000);
    });

    jsw.retainAll([map, marker]);
    marker.on.click.add((e) {
      map.zoom = 8;
      map.center = marker.position;
    });
  });
}