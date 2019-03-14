import 'package:flutter/material.dart';
import 'package:flutter_example/Components/PageTemplates/SinglelPageTemplate.dart';
import 'package:flutter_example/Utils/ColorUtils.dart';

class StackLayout extends StatelessWidget{

  _CreatePositioned({double width,double height,double left,double right,double top,double bottom}){
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Container(
        width:width,
        height:height,
        color: ColorUtils().RandomColor(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SinglePage(
      title: 'Stack Layout',
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment:Alignment.center ,
          children: <Widget>[
            Container(
              width:200,
              height:200,
              color: ColorUtils().RandomColor(),
            ),
            _CreatePositioned(
              width: 150,
              height: 150
            ),
            _CreatePositioned(
                width:100,
                height:100,
            ),
            _CreatePositioned(
                width: 100,
                height: 100,
                top: 0
            ),
            _CreatePositioned(
              bottom: 0,
                width: 100,
                height: 100,
            ),
            _CreatePositioned(
              left: 0,
                width: 50,
                height: 50,
            ),
            _CreatePositioned(
              right: 0,
                width: 50,
                height: 50,
            ),
            _CreatePositioned(
              left: 0,
              top: 0,
                width: 100,
                height: 100,
            ),
            _CreatePositioned(
              right: 0,
              top: 0,
                width: 100,
                height: 100,
            ),
            _CreatePositioned(
              right: 0,
              bottom: 0,
                width: 100,
                height: 100,
            ),
            _CreatePositioned(
              left: 0,
              bottom: 0,
                width: 100,
                height: 100
            ),
          ],
        ),
      ),
    );
  }
}