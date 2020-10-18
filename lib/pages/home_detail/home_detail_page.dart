import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gfiles_app/configure/gfiles_route.dart';
import 'package:gfiles_app/pages/home_detail/home_detail_view_model.dart';
import 'package:gfiles_app/widget/home_card.dart';
import 'package:provider/provider.dart';

import 'package:gfiles_app/api/repository/service/api_service.dart';

class HomeDetailPage extends StatelessWidget {

  final int idPost;
  HomeDetailPage(this.idPost);

  final _route = GfilesRoute();
  final _postApiService = PostApiService.create();

  @override
  Widget build(BuildContext context ) {
    return ChangeNotifierProvider(
      create: (_) => HomeDetailViewModel(_route, _postApiService),
      builder: (context, _) {
        return HomeDetailWidget(idPost);
      },
    );
  }

}

class HomeDetailWidget extends StatefulWidget {
  final int idPostW;

  HomeDetailWidget(this.idPostW);

  @override
  _HomeDetailWidgetState createState() => _HomeDetailWidgetState();
}

class _HomeDetailWidgetState extends State<HomeDetailWidget> {

  @override
  void initState() {
    context.read<HomeDetailViewModel>().onInit(widget.idPostW);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeDetailViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text(viewModel.status.titleBar),
      ),
      body: _buildPost(viewModel),
    );
  }

  Padding _buildPost(HomeDetailViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text(
              viewModel.status.post.title,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              )
          ),
          SizedBox(height: 8),
          Text(viewModel.status.post.body,),
        ],
      ),
    );
  }
}