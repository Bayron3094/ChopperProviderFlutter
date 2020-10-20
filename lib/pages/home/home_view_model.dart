import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:gfiles_app/api/model/post.dart';
import 'package:gfiles_app/api/model/post_model.dart';
import 'package:gfiles_app/api/repository/service/api_service.dart';
import 'package:gfiles_app/configure/gfiles_route.dart';
import 'package:gfiles_app/pages/home/home_status.dart';

class HomeViewModel with ChangeNotifier{
  HomeDetailStatus _status;
  final GfilesRoute _route;
  final PostApiService _postApiService;

  HomeViewModel(this._route, this._postApiService){
    _status = HomeDetailStatus(titleBar: 'Listado de Posts', listPost: [], isLoading: true);
  }
  HomeDetailStatus get status => _status;
  set status(HomeDetailStatus value) {
    _status = value;
    notifyListeners();
  }

  void onInit() async {
    final response = await _postApiService.getPosts();
    print("Response: ${response.body}");
    //final postDecode = ListPost.fromJson(json.decode(response.body.toString()));
    List<PostModel> postDecode = response.body.map(
            (j) => PostModel.fromJson(j)
    ).toList().cast<PostModel>();

    print("Decode: ${postDecode}");
    status = status.copyWith(listPost: postDecode, isLoading: false);
  }

  void onTapCard(int index) {
    _route.goHomeDetail(status.listPost[index].id);
  }
}