import 'package:chopper/chopper.dart';
import 'package:built_collection/built_collection.dart';
import 'package:gfiles_app/api/model/built_post.dart';

import 'package:gfiles_app/api/repository/converter/built_value_converter.dart';

part 'api_service.chopper.dart';

@ChopperApi(baseUrl: '/posts')
abstract class PostApiService extends ChopperService {
  @Get()
  // Update the type parameter of Response to BuiltList<BuiltPost>
  Future<Response<BuiltList<BuiltPost>>> getPosts();

  @Get(path: '/{id}')
  // For single returned objects, response will hold only one BuiltPost
  Future<Response<BuiltPost>> getPost(@Path('id') int id);

  @Post()
  Future<Response<BuiltPost>> postPost(
      @Body() BuiltPost post,
      );

  static PostApiService create() {
    final client = ChopperClient(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      services: [
        _$PostApiService(),
      ],
      converter: BuiltValueConverter(),
      interceptors: [
        HttpLoggingInterceptor(),
      ],
    );

    return _$PostApiService(client);
  }
}