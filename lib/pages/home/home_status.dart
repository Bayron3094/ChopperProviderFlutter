import 'package:gfiles_app/api/model/post_model.dart';

class HomeDetailStatus {
  final String titleBar;
  final List<PostModel> listPost;

  HomeDetailStatus({this.titleBar, this.listPost});

  HomeDetailStatus copyWith({String titleBar, List<PostModel> listPost}){
    return HomeDetailStatus(titleBar: titleBar ?? this.titleBar, listPost: listPost ?? this.listPost);
  }
}