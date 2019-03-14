import 'package:flutter/material.dart';
import 'package:flutter_example/Components/PageTemplates/SinglelPageTemplate.dart';

import 'package:flutter_example/Utils/ColorUtils.dart';

class FlexLayout extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  SinglePage(
        title: 'flex layout',
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _ListTitle(title: 'Flex Start'),
                _FlexRow(mainAxisAlignment: MainAxisAlignment.start),
                _ListTitle(title: 'Flex End'),
                _FlexRow(mainAxisAlignment: MainAxisAlignment.end),
                _ListTitle(title: 'Flex Center'),
                _FlexRow(mainAxisAlignment: MainAxisAlignment.center),
                _ListTitle(title: 'Flex Space Around'),
                _FlexRow(mainAxisAlignment: MainAxisAlignment.spaceAround),
                _ListTitle(title: 'Flex Flex Space Between'),
                _FlexRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
                _ListTitle(title: 'Flex Space Evenly'),
                _FlexRow(mainAxisAlignment: MainAxisAlignment.spaceEvenly),
              ],
            )
          )
        )
    );
  }
}

class _FlexRow extends StatelessWidget{

  MainAxisAlignment mainAxisAlignment;

  _FlexRow({Key key,@required this.mainAxisAlignment}):super(key:key);

  CreateContainers(int num){
     var _Containers = <Widget>[];
     for(int i=0;i<num;i++){
       _Containers.add(Container(
         width: 100,
         height: 100,
         color: ColorUtils().RandomColor(),
       ));
     }
     return _Containers;
  }
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: mainAxisAlignment, children: CreateContainers(3));
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