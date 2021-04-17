/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'DataHandlerStateManagement/AppData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  Provider.of<AppData>(context).upda();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppData(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: GestureDetector(
        child: Center(child: Image.asset("imagesAssets/blue_smile_hi.png")),
        onTap: () => {

        },
      ),
    );
  }
}
*/

// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'DataHandlerStateManagement/AppData.dart';
import 'ourWidgets/CountWidget.dart';

/// This is a reimplementation of the default Flutter application using provider + [ChangeNotifier].

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switch Image Example'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('Move to a new image'),

            /// Extracted as a separate widget for performance optimization.
            /// As a separate widget, it will rebuild independently from [MyHomePage].
            ///
            /// This is totally optional (and rarely needed).
            /// Similarly, we could also use [Consumer] or [Selector].
            Count(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('increment_floatingActionButton'),

        /// Calls `context.read` instead of `context.watch` so that it does not rebuild
        /// when [Counter] changes.
        onPressed: () => context.read<Counter>().increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.wifi_protected_setup),
      ),
    );
  }
}

/*
***** In pubspec.yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  provider: ^5.0.0

  */

/*
***** In lib/DataHandlerStateManagement/AppData.dart
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

  */

/*
***** In lib/models/ImageModel.dart
class ImageModel {
  // not in use yet
  String imagePath;

  ImageModel({this.imagePath});
}
  */

/*
***** In lib/ourWidgets/CountWidget.dart
import 'package:flutter/material.dart';
import 'package:flutter_tutorial_pdf_app/DataHandlerStateManagement/AppData.dart';
import 'package:provider/provider.dart';

class Count extends StatelessWidget {
  const Count({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset('${context.watch<Counter>().path}');

    /* Text(

        /// Calls `context.watch` to make [Count] rebuild when [Counter] changes.
          '${context.watch<Counter>().count}',
          key: const Key('counterState'),
          style: Theme.of(context).textTheme.headline4);*/
  }
}

  */
