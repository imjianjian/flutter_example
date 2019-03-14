import 'package:flutter/material.dart';
import 'package:flutter_example/Components/PageTemplates/SinglelPageTemplate.dart';
import 'package:flutter_example/Utils/ColorUtils.dart';

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
    return SinglePage(
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
      color: ColorUtils().RandomColor(),
      child: Center(
        child: Text("$index"),
      ),
    );
  }
}