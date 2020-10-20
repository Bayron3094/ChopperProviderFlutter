import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:chopper/chopper.dart';
import 'package:gfiles_app/configure/gfiles_route.dart';
import 'package:gfiles_app/pages/home/home_view_model.dart';
import 'package:gfiles_app/pages/home_detail/home_detail_page.dart';
import 'package:gfiles_app/widget/home_card.dart';
import 'package:provider/provider.dart';

import 'package:gfiles_app/api/repository/service/api_service.dart';

class HomePage extends StatelessWidget {

  final _route = GfilesRoute();

  final _postApiService = PostApiService.create();

  @override
  Widget build(BuildContext context ) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(_route, _postApiService),
      builder: (context, _) {
        return HomeWidget();
      },
    );
  }

}

class HomeWidget extends StatefulWidget {

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {

  @override
  void initState() {
    context.read<HomeViewModel>().onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text(viewModel.status.titleBar),
      ),
      body: _buildPosts(viewModel),
      /*floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add)
            ),*/
    );
  }

  Widget _buildPosts(HomeViewModel viewModel) {

    if(viewModel.status.isLoading){
      return CircularProgressIndicator();
    }
    return ListView.builder(
      itemCount: viewModel.status.listPost.length,
      padding: EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return HomeCard(
            title: viewModel.status.listPost[index].title,
            body: viewModel.status.listPost[index].body,
            onTap: (){
              viewModel.onTapCard(index);
            }
        );
      },
    );
  }

  void _navigateToPost(BuildContext context, int id) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => HomeDetailPage(id),
      ),
    );
  }
}