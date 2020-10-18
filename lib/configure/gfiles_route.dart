import 'package:flutter/material.dart';
import 'package:gfiles_app/pages/home_detail/home_detail_page.dart';

class GfilesRoute {

  static final GfilesRoute _singleton = GfilesRoute._internal();

  factory GfilesRoute() {
    return _singleton;
  }

  GfilesRoute._internal();

  final navigatorKey = GlobalKey<NavigatorState>();

  goHomeDetail(int id){
      navigatorKey.currentState.push(MaterialPageRoute(builder: (_)=> HomeDetailPage(id)));
  }
}