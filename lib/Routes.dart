import 'package:flutter/cupertino.dart';
import 'package:flutter_example/Pages/Interactivity/StatefulWidget.dart';
import 'package:flutter_example/main.dart';

Map<String, WidgetBuilder> myRoutes= {
    '/': (context) => HomePage(),
    '/mystatefulidget': (context) => MyStatefulWidget(),
};