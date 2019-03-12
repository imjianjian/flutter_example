import 'package:flutter/material.dart';

class FlexLayout extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"flex layout",
      home: Scaffold(
        appBar: AppBar(
          title: Text('flex layout'),
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
            Navigator.pop(context);
          }),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text('Flex Start',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.pink,
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.blue,
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.amber,
                    ),
                  ],
                ),
                Text('Flex End',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.pink,
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.blue,
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.amber,
                    ),
                  ],
                ),
                Text('Flex Center',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.pink,
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.blue,
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.amber,
                    ),
                  ],
                ),
                Text('Flex Space Around',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.pink,
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.blue,
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.amber,
                    ),
                  ],
                ),
                Text('Flex Space Between',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.pink,
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.blue,
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.amber,
                    ),
                  ],
                ),
                Text('Flex Space Evenly',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.pink,
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.blue,
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.amber,
                    ),
                  ],
                )
              ],
            )
          )
        ),
      ),
    );
  }

}