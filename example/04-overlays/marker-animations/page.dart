import 'dart:html';
import 'package:js/js.dart' as js;
import 'package:google_maps/jswrap.dart' as jsw;
import 'package:google_maps/gmaps.dart' as gmaps;

final gmaps.LatLng stockholm = jsw.retain(new gmaps.LatLng(59.32522, 18.07002));
final gmaps.LatLng parliament = jsw.retain(new gmaps.LatLng(59.327383, 18.06747));
gmaps.Marker marker;
gmaps.GMap map;

void main() {
  js.scoped(() {
    final mapOptions = new gmaps.MapOptions()
      ..zoom = 13
      ..mapTypeId = gmaps.MapTypeId.ROADMAP
      ..center = stockholm
      ;
    map = jsw.retain(new gmaps.GMap(query("#map_canvas"), mapOptions));

    marker = jsw.retain(new gmaps.Marker(new gmaps.MarkerOptions()
      ..map = map
      ..draggable = true
      ..animation = gmaps.Animation.DROP
      ..position = parliament
    ));
    marker.on.click.add((e) => toggleBounce());
  });
}

void toggleBounce() {
  if (marker.animation != null) {
    marker.animation = null;
  } else {
    marker.animation = gmaps.Animation.BOUNCE;
  }
}