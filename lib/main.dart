import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:tst/beamer.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  
  final route = BeamerDelegate(
    locationBuilder: BeamerLocationBuilder(beamLocations: [BooksLocation()]),
    notFoundRedirectNamed: '/books'
  );
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: route,
      routeInformationParser: BeamerParser(),
      backButtonDispatcher: BeamerBackButtonDispatcher(delegate: route),
    );
  }
}


