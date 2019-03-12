import 'package:flutter/material.dart';

class NormalPage extends StatelessWidget{
  String title;
  Widget body;
  NormalPage({Key key,@required this.title,@required this.body}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title)
        ),
        body: body
    );
  }
}