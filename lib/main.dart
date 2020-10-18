import 'package:flutter/material.dart';

import 'package:gfiles_app/pages/home/home_page.dart';
import 'package:gfiles_app/configure/gfiles_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: GfilesRoute().navigatorKey,
      title: 'Material App',
      home: HomePage(),
    );
  }
}
