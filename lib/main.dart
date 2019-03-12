import 'package:flutter/material.dart';
import 'package:flutter_example/Animate/HeroAnimation.dart';
import 'package:flutter_example/Animate/StaggeredAnimations.dart';
import 'package:flutter_example/Interactivity/Navigation.dart';
import 'package:flutter_example/Interactivity/StatefulWidget.dart';
import 'package:flutter_example/Layout/FlexLayout.dart';
import 'package:flutter_example/Layout/GridLayout.dart';
import 'package:flutter_example/Layout/StackLayout.dart';
import 'package:flutter_example/Routes.dart';
import 'package:flutter_example/Animate/myAnimation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Example',
        routes: myRoutes,
    );
  }
}

class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
          appBar: AppBar(
            title: Text('Flutter Example'),
          ),
          body: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(8.0),
            children: <Widget>[
              _ListTitle(title: 'Layout'),
              _ListItem(routes: FlexLayout(),title: 'Flex Layout'),
              _ListItem(routes: GridLayout(),title: 'Grid Layout'),
              _ListItem(routes: StackLayout(),title: 'Stack Layout'),

              _ListTitle(title: 'Interactivity'),
              _ListItem(routes: MyStatefulWidget(),title: 'StatefulWidget'),
              _ListItem(routes: myNavigation(),title: 'Navigation & routing'),

              _ListTitle(title: 'Animate'),
              _ListItem(routes: myAnimation(),title: 'Animation'),
              _ListItem(routes: HeroPageOne(),title: 'Hero Animation'),
              _ListItem(routes: myStaggeredAnimations(),title: 'Staggered Animation'),
            ],
          ),
    );
  }

}

class _ListItem extends StatelessWidget{
  Widget routes;
  String title;
  _ListItem({Key key,@required this.routes,@required this.title}): super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => routes),
          );
        },
        child:Card(
            child: Container(
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(8.0),
              child: Text(title,
                  style: TextStyle(
                    fontSize:20.0,
                  )),
            )
        )
    );
  }
}

class _ListTitle extends StatelessWidget{
  String title;
  _ListTitle({Key key,@required this.title}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title,
          style: TextStyle(
              fontSize: 24,
              color:Colors.pink,
              fontWeight: FontWeight.bold
          )),
    );
  }
}