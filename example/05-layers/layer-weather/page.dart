import 'dart:html';
import 'package:js/js.dart' as js;
import 'package:google_maps/jswrap.dart' as jsw;
import 'package:google_maps/gmaps.dart' as gmaps;
import 'package:google_maps/gmaps_weather.dart' as gmaps_weather;

void main() {
  js.scoped(() {
    final mapOptions = new gmaps.MapOptions()
      ..zoom = 6
      ..center = new gmaps.LatLng(49.265984,-123.127491)
      ..mapTypeId = gmaps.MapTypeId.ROADMAP
      ;
    final map = new gmaps.GMap(query("#map_canvas"), mapOptions);

    final weatherLayer = new gmaps_weather.WeatherLayer(new gmaps_weather.WeatherLayerOptions()
      ..temperatureUnits = gmaps_weather.TemperatureUnit.FAHRENHEIT
    );
    weatherLayer.map = map;

    final cloudLayer = new gmaps_weather.CloudLayer();
    cloudLayer.map = map;
  });
}
