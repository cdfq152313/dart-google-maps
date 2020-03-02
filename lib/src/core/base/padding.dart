part of google_maps.src;

class Padding extends JsInterface {
  Padding({
    num top,
    num right,
    num bottom,
    num left,
  }) : this.created(JsObject.jsify({
          'top': top,
          'right': right,
          'bottom': bottom,
          'left': left,
        }));

  Padding.created(JsObject o) : super.created(o);

  bool equals(Size other) => asJsObject(this).callMethod('equals', [__codec3.encode(other)]);

  String toString() => asJsObject(this).callMethod('toString');

  set top(num top) {
    asJsObject(this)['top'] = top;
  }

  num get top => asJsObject(this)['top'];

  set right(num right) {
    asJsObject(this)['right'] = right;
  }

  num get right => asJsObject(this)['right'];

  set bottom(num bottom) {
    asJsObject(this)['bottom'] = bottom;
  }

  num get bottom => asJsObject(this)['bottom'];

  set left(num left) {
    asJsObject(this)['left'] = left;
  }

  num get left => asJsObject(this)['left'];
}

final paddingCodec = JsInterfaceCodec<Padding>((o) => Padding.created(o));