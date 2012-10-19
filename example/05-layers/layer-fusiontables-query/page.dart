import 'dart:html';
import 'package:js/js.dart' as js;
import 'package:google_maps/jswrap.dart' as jsw;
import 'package:google_maps/gmaps.dart' as gmaps;

void main() {
  js.scoped(() {
    final chicago = new gmaps.LatLng(41.948766, -87.691497);
    final map = new gmaps.GMap(query("#map_canvas"), new gmaps.MapOptions()
      ..center = chicago
      ..zoom = 12
      ..mapTypeId = gmaps.MapTypeId.ROADMAP
    );

    final layer = new gmaps.FusionTablesLayer(new gmaps.FusionTablesLayerOptions()
      ..query = (new gmaps.FusionTablesQuery()
        ..select = 'address'
        ..from = '1d7qpn60tAvG4LEg4jvClZbc1ggp8fIGGvpMGzA'
        ..where = 'ridership > 5000'
      )
    );
    layer.map = map;
  });
}
