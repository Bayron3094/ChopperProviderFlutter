import 'package:gfiles_app/api/model/built_post.dart';
import 'package:gfiles_app/api/model/post_model.dart';

class HomeDetailStatus {
  final String titleBar;
  final BuiltPost post;

  HomeDetailStatus({this.titleBar, this.post});

  HomeDetailStatus copyWith({String titleBar, BuiltPost post}){
    return HomeDetailStatus(titleBar: titleBar ?? this.titleBar, post: post ?? this.post);
  }
}