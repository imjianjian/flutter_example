import 'package:flutter/material.dart';
import 'package:flutter_example/Components/PageTemplates/SinglelPageTemplate.dart';

class myPointerMoveEvent extends StatefulWidget{

  @override
  State createState() {
    return PointerMoveEventState();
  }
}

class PointerMoveEventState  extends State<myPointerMoveEvent>{
  String _event='no event';

  void updateText(String text) =>setState(()=>_event=text);

  @override
  Widget build(BuildContext context) {
    return SinglePage(
        title: 'Pointer Move Event',
        body: Center(
            child: Listener(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepOrange,width: 5)
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
              onPointerDown: (e)=>updateText(e.toString()),
              onPointerUp: (e)=>updateText(e.toString()),
              onPointerMove: (e)=>updateText(e.toString()),
          ),
        )
    );
  }
}