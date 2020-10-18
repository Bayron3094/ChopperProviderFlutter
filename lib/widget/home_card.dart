import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String title;
  final String body;
  final VoidCallback onTap;

  HomeCard({@required this.title, @required this.body, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4,
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(body),
          onTap: onTap
        )
    );
  }
}