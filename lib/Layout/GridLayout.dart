import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_example/Components/PageTemplates/normalPageTemplate.dart';

class GridLayout extends StatelessWidget{

   createGridItem(int num){
     var widgets = <Widget>[];
     for(int i=0;i<num;i++){
       widgets.add(_GridItem(index:i+1));
     }
     return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return NormalPage(
      title: 'Grid Layout',
      body: Center(
        child: GridView.count(
          crossAxisCount: 3,
          children: createGridItem(21),
        ),
      ),
    );
  }
}

class _GridItem extends StatelessWidget{
  int index;
  _GridItem({Key key,@required this.index}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255)),
      child: Center(
        child: Text("$index"),
      ),
    );
  }
}