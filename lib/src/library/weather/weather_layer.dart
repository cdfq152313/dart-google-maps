// Copyright (c) 2015, Alexandre Ardhuin
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

part of google_maps.src.weather;

@JsName('google.maps.weather.WeatherLayer')
abstract class _WeatherLayer extends MVCObject {
  factory _WeatherLayer([WeatherLayerOptions opts]) => null;

  GMap get map => _getMap();
  GMap _getMap();
  set map(GMap map) => _setMap(map);
  void _setMap(GMap map);
  set options(WeatherLayerOptions options) => _setOptions(options);
  void _setOptions(WeatherLayerOptions options);

  Stream<WeatherMouseEvent> get onClick =>
      getStream(this, 'click', (o) => WeatherMouseEvent.created(o));
}
