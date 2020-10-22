import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:gfiles_app/api/model/built_post.dart';
import 'package:gfiles_app/api/model/post_model.dart';
import 'package:gfiles_app/api/repository/service/api_service.dart';
import 'package:gfiles_app/configure/gfiles_route.dart';
import 'package:gfiles_app/pages/home_detail/home_detail_status.dart';

class HomeDetailViewModel with ChangeNotifier{
  HomeDetailStatus _status;
  final GfilesRoute _route;
  final PostApiService _postApiService;

  HomeDetailViewModel(this._route, this._postApiService){
    _status = HomeDetailStatus(titleBar: 'Listado de Posts', post: BuiltPost());
  }

  HomeDetailStatus get status => _status;

  set status(HomeDetailStatus value) {
    _status = value;
    notifyListeners();
  }

  void onInit(int id) async {
    final response = await _postApiService.getPost(id);
    print("Response: ${response.body}");
    //final postDecode = PostModel.fromJson(response.body);
    final postDecode = response.body;
    print("Decode: ${postDecode}");
    status = status.copyWith(post: postDecode);
  }
}