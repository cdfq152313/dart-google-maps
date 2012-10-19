import 'dart:html';
import 'package:js/js.dart' as js;
import 'package:google_maps/jswrap.dart' as jsw;
import 'package:google_maps/gmaps.dart' as gmaps;

gmaps.DirectionsRenderer directionsDisplay;
final gmaps.DirectionsService directionsService = jsw.retain(new gmaps.DirectionsService());

void main() {
  js.scoped(() {
    directionsDisplay = jsw.retain(new gmaps.DirectionsRenderer());
    final mapOptions = new gmaps.MapOptions()
      ..zoom = 7
      ..mapTypeId = gmaps.MapTypeId.ROADMAP
      ..center = new gmaps.LatLng(41.850033, -87.6500523)
      ;
    final map = new gmaps.GMap(query("#map_canvas"), mapOptions);
    directionsDisplay.map = map;
    directionsDisplay.panel = query('#directions-panel');

    final control = query('#control');
    control.style.display = 'block';
    map.controls.getNodes(gmaps.ControlPosition.TOP_CENTER).push(control);

    query('#start').on.change.add((e) => calcRoute());
    query('#end').on.change.add((e) => calcRoute());
  });
}

void calcRoute() {
  js.scoped(() {
    final start = (query('#start') as SelectElement).value;
    final end = (query('#end') as SelectElement).value;
    final request = new gmaps.DirectionsRequest()
      ..origin = start
      ..destination = end
      ..travelMode = gmaps.TravelMode.DRIVING // TODO bad object in example DirectionsTravelMode
      ;
    directionsService.route(request, (gmaps.DirectionsResult response, gmaps.DirectionsStatus status) {
      if (status == gmaps.DirectionsStatus.OK) {
        directionsDisplay.directions = response;
      }
    });
  });
}