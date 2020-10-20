import 'package:gfiles_app/api/model/post_model.dart';

class HomeDetailStatus {
  final String titleBar;
  final List<PostModel> listPost;
  final bool isLoading;

  HomeDetailStatus({this.titleBar, this.listPost, this.isLoading});

  HomeDetailStatus copyWith({String titleBar, List<PostModel> listPost, bool isLoading}){
    return HomeDetailStatus(titleBar: titleBar ?? this.titleBar, listPost: listPost ?? this.listPost, isLoading: isLoading ?? this.isLoading);
  }
}