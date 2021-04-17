import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Mix-in [DiagnosticableTreeMixin] to have access to [debugFillProperties] for the devtool
// ignore: prefer_mixin
class Counter with ChangeNotifier, DiagnosticableTreeMixin {
  int _count = 0;
  String _imagePath = 'imagesAssets/blue_smile_hi.png';

  int get count => _count;
  String get path => _imagePath;

  void increment() {
    if (_count % 2 == 0)
      _imagePath = 'imagesAssets/multiSmile.jpg';
    else
      _imagePath = 'imagesAssets/blue_smile_hi.png';
    if (_count == 10) _count = 0;
    _count++;
    notifyListeners();
  }
  /*void deincrement() {
    _imagePath = 'imagesAssets/blue_smile_hi.png';
    notifyListeners();
  }*/

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('count', path));
  }
}
