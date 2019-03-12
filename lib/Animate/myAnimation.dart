import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class myAnimation extends StatefulWidget {

  @override
  State createState() {
    return myAnimationState();
  }
}

class myAnimationState extends State<myAnimation> with SingleTickerProviderStateMixin{

  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0,end: 300).animate(controller)
      ..addListener((){
        setState(() {

        });
      });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animate"),
      ),
      body: Center(
        child:
          Container(
            margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
            width: animation.value,
            height: animation.value,
            child: FlutterLogo(),
          ),
      ),
    );
  }
}
