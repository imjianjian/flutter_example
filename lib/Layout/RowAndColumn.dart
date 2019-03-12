import 'package:flutter/material.dart';

class RowAndCloumn extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"row and column",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Row And Column'),
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
            Navigator.pop(context);
          }),
        ),
        body: Center(
            child: Column(
              children: <Widget>[
                Text('Row',
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
                Text('Column',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                )),
                Column(
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
            ),

        ),
      ),
    );
  }

}