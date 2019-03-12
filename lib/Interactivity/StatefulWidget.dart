
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example/Components/PageTemplates/normalPageTemplate.dart';

class MyStatefulWidget extends StatefulWidget  {
  @override
  State createState() {
    return MyStateWidget();
  }
}

class MyStateWidget extends State<MyStatefulWidget>{
  int count = 0;
  bool active = false;

  void countUp(){
    setState(() {
      count==100?100:count+=1;
    });
  }

  void countDown(){
    setState(() {
      count==0?0:count-=1;
    });
  }

  void ChangeActive(){
    setState(() {
      active=!active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return NormalPage(
            title: 'StatefulWidget',
            body: Center(
              child: Container(
                child: Column(
                  children: <Widget>[
                    //count state
                    Container(
                      margin: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('count:'+count.toString(),
                          style: TextStyle(
                            fontSize: 20
                          ),),
                          RaisedButton(child: Text('+'),onPressed:countUp,),
                          RaisedButton(child: Text('-'),onPressed:countDown,)
                        ],
                      ),
                    ),
                    //active state
                    Container(
                      margin: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          GestureDetector(
                            onTap: ChangeActive,
                            child: Container(
                              width: 100,
                              height: 100,
                              color: active?Colors.pink:Colors.grey,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(active?'active':'unactive')
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: ChangeActive,
                            child: Container(
                              width: 100,
                              height: 100,
                              color: !active?Colors.pink:Colors.grey,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(!active?'active':'unactive')
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // other active widget
                    Container(
                      margin: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Checkbox(
                            value: active,
                            activeColor: Colors.pink,
                            onChanged: (bool newValue){
                              ChangeActive();
                            },
                          ),
                          Checkbox(
                            value: !active,
                            activeColor: Colors.pink,
                            onChanged: (bool newValue){
                              ChangeActive();
                            },
                          )
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Slider(
                            min: 0,
                            max:100,
                            value: count.toDouble(),
                            activeColor: Colors.pink,
                            onChanged: (double newValue){
                              setState(() {
                                count=newValue.toInt();
                              });
                            },
                          )
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Switch(
                            value: active,
                            activeColor: Colors.pink,
                            onChanged: (bool newValue){
                              ChangeActive();
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
    );
  }
}