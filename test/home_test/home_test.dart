import 'package:chopper/chopper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gfiles_app/api/model/built_post.dart';
import 'package:gfiles_app/api/repository/interactors/api_interactor.dart';
import 'package:gfiles_app/configure/gfiles_route.dart';

import 'package:gfiles_app/pages/home/home_view_model.dart';
import 'package:mockito/mockito.dart';

class MockGFilesRoute with Mock implements GfilesRoute{
}

class MockApiInteractor with Mock implements ApiInteractor{
}

void main() {

  final _route = MockGFilesRoute();
  final _interactor = MockApiInteractor();
  HomeViewModel subject() => HomeViewModel(_route, _interactor);

  group('Pruebas HomeViewModel', () {

    group('Constructor - ', () {
      /*test(''){

      }*/
    });

    group('onInit - ', () {
      setUpAll((){
        final response = Future.value([BuiltPost((b) => b..title = "Title"..body = "Body"..id = 1)]);

        when(_interactor.getBuiltPost()).thenAnswer((_) => response);
      });

      test("Show isLoading be false", () async {

        final viewModel = subject();
        await viewModel.onInit();
        expect(viewModel.status.isLoading, false);
      });

      test("ListPost should be is not empty", () async {

        final viewModel = subject();
        await viewModel.onInit();
        expect(viewModel.status.listPost, isNotEmpty);
      });
    });
  });
}


//final response = await _postApiService.getPosts();