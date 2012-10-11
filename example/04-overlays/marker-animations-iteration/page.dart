#import('dart:html');
#import('package:js/js.dart', prefix:'js');
#import('package:dart_google_maps/jswrap.dart', prefix:'jsw');
#import('package:dart_google_maps/gmaps.dart', prefix:'gmaps');

final berlin = jsw.retain(new gmaps.LatLng(52.520816, 13.410186));
final List<gmaps.LatLng> neighborhoods = [
  jsw.retain(new gmaps.LatLng(52.511467, 13.447179)),
  jsw.retain(new gmaps.LatLng(52.549061, 13.422975)),
  jsw.retain(new gmaps.LatLng(52.497622, 13.396110)),
  jsw.retain(new gmaps.LatLng(52.517683, 13.394393))
];

final markers = new List<gmaps.Marker>();
int iterator = 0;

gmaps.GMap map;

void main() {
  js.scoped(() {
    final mapOptions = new gmaps.MapOptions()
      ..zoom = 12
      ..mapTypeId = gmaps.MapTypeId.ROADMAP
      ..center = berlin;
    map = jsw.retain(new gmaps.GMap(query("#map_canvas"), mapOptions));

    query("#drop").on.click.add(drop);
  });
}

void drop(e) {
  js.scoped(() {
    for (var i = 0; i < neighborhoods.length; i++) {
      window.setTimeout(addMarker, i * 200);
    }
  });
}

void addMarker() {
  js.scoped(() {
    markers.add(new gmaps.Marker(new gmaps.MarkerOptions()
      ..position = neighborhoods[iterator % neighborhoods.length]
      ..map = map
      ..draggable = false
      ..animation = gmaps.Animation.DROP
    ));
    iterator++;
  });
}