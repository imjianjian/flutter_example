import 'package:flutter/material.dart';
import 'package:flutter_example/Pages/Animation/HeroAnimation.dart';
import 'package:flutter_example/Pages/Animation/StaggeredAnimations.dart';
import 'package:flutter_example/Pages/Interactivity/Navigation.dart';
import 'package:flutter_example/Pages/Interactivity/StatefulWidget.dart';
import 'package:flutter_example/Pages/Layout/FlexLayout.dart';
import 'package:flutter_example/Pages/Layout/GridLayout.dart';
import 'package:flutter_example/Pages/Layout/StackLayout.dart';
import 'package:flutter_example/Pages/ScopedModel/CatalogPage.dart';
import 'package:flutter_example/Pages/Http/HttpClientAndDio.dart';
import 'package:flutter_example/Routes.dart';
import 'package:flutter_example/Pages/Animation/myAnimation.dart';
import 'package:flutter_example/Model/CartModel.dart';
import 'package:flutter_example/Model/CatalogModel.dart';
import 'package:flutter_example/Pages/Event/PointMoveEvent.dart';
import 'package:flutter_example/Pages/Event/Gesture.dart';
import 'package:provide/provide.dart';

void main() {

  var cart = CartModel();
  var catalog = CatalogModel();

  catalog.addToCatalog(CatalogItem(name: 'apple',price: 12.0));
  catalog.addToCatalog(CatalogItem(name: 'banana',price: 15.0));
  catalog.addToCatalog(CatalogItem(name: 'orange',price: 16.0));
  catalog.addToCatalog(CatalogItem(name: 'Grape',price: 18.0));

  var providers = Providers();

  providers
    ..provide(Provider<CartModel>.value(cart))
    ..provide(Provider<CatalogModel>.value(catalog));

  runApp(ProviderNode(
      providers: providers,
      child: MyApp(),
  ));
}

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

              _ListTitle(title: 'Model'),
              _ListItem(routes: CatalogPage(),title: 'CartModel'),

              _ListTitle(title: 'Http'),
              _ListItem(routes: HttpPage(),title: 'HttpClient & Dio'),

              _ListTitle(title: 'Event'),
              _ListItem(routes: myPointerMoveEvent(),title: 'Pointer Move Event'),
              _ListItem(routes: Gesture(),title: 'Gesture'),
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