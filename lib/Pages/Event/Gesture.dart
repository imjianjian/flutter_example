import 'package:flutter/material.dart';
import 'package:flutter_example/Components/PageTemplates/SinglelPageTemplate.dart';

class Gesture extends StatefulWidget{

  @override
  State createState() {
    return GestureState();
  }
}

class GestureState extends State<Gesture>{

  String _event='no event';

  void updateText(String text) =>setState(()=>_event=text);

  @override
  Widget build(BuildContext context) {
    return SinglePage(
        title: 'Gesture',
        body: Center(
          child: GestureDetector(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.amber,width: 5),
              ),
              child: Center(
                child: Text(_event,
                    style: TextStyle(
                        color: Colors.pink,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    )
                ),
              ),
            ),
            onDoubleTap: ()=>updateText('Double Tap'),
            onLongPress: ()=>updateText('Long Press'),
            onTap: ()=>updateText('Tap'),
            onPanDown: (e)=>updateText(e.toString()),
            onPanUpdate: (e)=>updateText(e.toString()),
            onPanEnd: (e)=>updateText(e.toString()),
        ),
      )
    );
  }
}