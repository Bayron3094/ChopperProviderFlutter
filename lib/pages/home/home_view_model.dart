import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:gfiles_app/api/model/built_post.dart';
import 'package:gfiles_app/api/model/post_model.dart';
import 'package:gfiles_app/api/repository/interactors/api_interactor.dart';
import 'package:gfiles_app/api/repository/service/api_service.dart';
import 'package:gfiles_app/configure/gfiles_route.dart';
import 'package:gfiles_app/pages/home/home_status.dart';

class HomeViewModel with ChangeNotifier{
  HomeDetailStatus _status;
  final GfilesRoute _route;
  final ApiInteractor _interactor;

  HomeViewModel(this._route, this._interactor){
    _status = HomeDetailStatus(titleBar: 'Listado de Posts', listPost: [], isLoading: true);
  }

  HomeDetailStatus get status => _status;
  set status(HomeDetailStatus value) {
    _status = value;
    notifyListeners();
  }

  void onInit() async {
    final response = await _interactor.getBuiltPost();
    print("Response: ${response}");
    //final postDecode = ListPost.fromJson(json.decode(response.body.toString()));
    /*= response.body.map(
            (j) => PostModel.fromJson(j)
    ).toList().cast<PostModel>();*/

    status = status.copyWith(listPost: response, isLoading: false);
  }

  void onTapCard(int index) {
    _route.goHomeDetail(status.listPost[index].id);
  }
}