#import('dart:html');
#import('package:js/js.dart', prefix:'js');
#import('package:google_maps/jswrap.dart', prefix:'jsw');
#import('package:google_maps/gmaps.dart', prefix:'gmaps');
#import('package:google_maps/gmaps-panoramio.dart', prefix:'gmaps_panoramio');

void main() {
  js.scoped(() {
    final mapOptions = new gmaps.MapOptions()
      ..zoom = 16
      ..center = new gmaps.LatLng(47.651743, -122.349243)
      ..mapTypeId = gmaps.MapTypeId.ROADMAP
      ;
    final map = new gmaps.GMap(query("#map_canvas"), mapOptions);

    final panoramioLayer = new gmaps_panoramio.PanoramioLayer();
    panoramioLayer.map = map;

    final photoPanel = query('#photo-panel');
    map.controls.getNodes(gmaps.ControlPosition.RIGHT_TOP).push(photoPanel);

    panoramioLayer.on.click.add((e) {
      final li = new LIElement();
      final link = new AnchorElement();
      link.innerHTML = '${e.featureDetails.title}: ${e.featureDetails.author}';
      link.href = e.featureDetails.url;
      li.elements.add(link);
      photoPanel.elements.add(li);
      photoPanel.style.display = 'block';
    });
  });
}
