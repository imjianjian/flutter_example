import 'package:flutter/material.dart';

class myStaggeredAnimations extends StatefulWidget {
  @override
  _myStaggeredAnimationsState createState() => _myStaggeredAnimationsState();
}

class _myStaggeredAnimationsState extends State<myStaggeredAnimations> with SingleTickerProviderStateMixin{

  AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this,duration: Duration(seconds:5));
  }

  Future<void> _playAnimation() async {
    try {
      await controller.forward().orCancel;
      await controller.reverse().orCancel;
    } on TickerCanceled {
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Staggered Animation'),
      ),
      body:Center(
        child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 300.0,
                height: 300.0,
                padding: EdgeInsets.all(50.0),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  border: Border.all(
                    color:  Colors.black.withOpacity(0.5),
                  ),
                ),
                child: _myStaggeredAnimations(
                    controller: controller.view
                ),
              ),
              RaisedButton(
                child: Text('click'),
                onPressed: (){
                  _playAnimation();
                },
              )
            ],
          )
        ),
      );
  }
}

class _myStaggeredAnimations extends StatelessWidget{

  final Animation<double> controller;
  final Animation<double> opacity;
  final Animation<double> width;
  final Animation<double> height;
  final Animation<EdgeInsets> padding;
  final Animation<BorderRadius> borderRadius;
//  final Animation<Color> color;

  _myStaggeredAnimations({ Key key, this.controller}):
    opacity = Tween<double>(
      begin: 0,
      end: 1
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(
          0, 0.2,
          curve: Curves.ease)
    )),

    width = Tween<double>(
      begin: 50.0,
      end: 150.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.2, 0.5,
          curve: Curves.ease,
        ),
      ),
    ),

    height = Tween<double>(
      begin: 30,
      end: 60
    ).animate(CurvedAnimation(parent: controller, curve: Interval(
        0.2, 0.5,
        curve: Curves.ease))),

    padding = Tween<EdgeInsets>(
        begin: EdgeInsets.all(8.0),
        end: EdgeInsets.all(30.0)
    ).animate(CurvedAnimation(parent: controller, curve: Interval(
        0.5, 1,
        curve: Curves.ease))),

    borderRadius = BorderRadiusTween(
      begin: BorderRadius.circular(4.0),
      end: BorderRadius.circular(75.0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.5, 1,
          curve: Curves.ease,
        ),
      ),
    ),
//        color = Tween<Color>(
//          begin: Colors.pink,
//          end: Colors.blue
//        ).animate(CurvedAnimation(parent: controller, curve: Interval(0.375, 0.500, curve: Curves.ease))),

    super(key:key);


  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: controller, builder: _AnimationBuilder);
  }

  Widget _AnimationBuilder(BuildContext context, Widget child) {
    return Container(
      padding: padding.value,
      alignment: Alignment.bottomCenter,
      child: Opacity(opacity:opacity.value,child: Container(
        width: width.value,
        height: height.value,
        decoration: BoxDecoration(
//          color: color.value,
          border: Border.all(
            color: Colors.indigo[300],
            width: 3.0,
          ),
          borderRadius: borderRadius.value,
        ),
      )),
    );
  }
}