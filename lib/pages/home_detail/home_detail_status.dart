import 'package:gfiles_app/api/model/post_model.dart';

class HomeDetailStatus {
  final String titleBar;
  final PostModel post;

  HomeDetailStatus({this.titleBar, this.post});

  HomeDetailStatus copyWith({String titleBar, PostModel post}){
    return HomeDetailStatus(titleBar: titleBar ?? this.titleBar, post: post ?? this.post);
  }
}