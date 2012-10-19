import 'dart:html';
import 'package:js/js.dart' as js;
import 'package:google_maps/jswrap.dart' as jsw;
import 'package:google_maps/gmaps.dart' as gmaps;

void main() {
  js.scoped(() {
    final fenway = new gmaps.LatLng(42.345573,-71.098326);
    final mapOptions = new gmaps.MapOptions()
      ..center = fenway
      ..zoom = 14
      ..mapTypeId = gmaps.MapTypeId.ROADMAP
      ;
    final map = new gmaps.GMap(query('#map_canvas'), mapOptions);
  });
}