import 'dart:html';
import 'package:js/js.dart' as js;
import 'package:google_maps/jswrap.dart' as jsw;
import 'package:google_maps/gmaps.dart' as gmaps;

gmaps.Polyline poly;
gmaps.GMap map;

void main() {
  js.scoped(() {
    final chicago = new gmaps.LatLng(41.879535, -87.624333);
    final mapOptions = new gmaps.MapOptions()
      ..zoom = 7
      ..center = chicago
      ..mapTypeId = gmaps.MapTypeId.ROADMAP
      ;
    map = jsw.retain(new gmaps.GMap(query("#map_canvas"), mapOptions));

    final polyOptions = new gmaps.PolylineOptions()
      ..strokeColor = '#000000'
      ..strokeOpacity = 1.0
      ..strokeWeight = 3
      ;
    poly = jsw.retain(new gmaps.Polyline(polyOptions));
    poly.map = map;

    // Add a listener for the click event
    map.on.click.add(addLatLng);
  });
}

/**
 * Handles click events on a map, and adds a new point to the Polyline.
 * @param {MouseEvent} mouseEvent
 */
void addLatLng(gmaps.MouseEvent e) {
  final path = poly.path;

  // Because path is an MVCArray, we can simply append a new coordinate
  // and it will automatically appear
  path.push(e.latLng);

  // Add a new marker at the new plotted point on the polyline.
  var marker = new gmaps.Marker(new gmaps.MarkerOptions()
    ..position = e.latLng
    ..title = '#${path.length}'
    ..map = map
  );
}