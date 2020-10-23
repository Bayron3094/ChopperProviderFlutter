import 'package:gfiles_app/api/model/built_post.dart';
import 'package:gfiles_app/api/repository/service/api_service.dart';

class ApiInteractor {

  final service = PostApiService.create();

  Future<List<BuiltPost>> getBuiltPost() async {
    final response = await service.getPosts();
    return response.body.toList();
  }
}