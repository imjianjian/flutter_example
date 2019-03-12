import 'package:flutter/material.dart';

class myNavigation extends StatefulWidget{

  @override
  State createState() {
    return myNavigationState();
  }
}

class myNavigationState extends State<myNavigation>{

  TextEditingController msgController = new TextEditingController();
//  data form PageD
  var backData='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Navigation')),
      body: ListView(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

//                animating hero
                Hero(
                  tag: 'imageHero',
                  child: Image.asset('assets/lake.jpg'),
                ),
//            Navigate to a new screen and back
                RaisedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PageB()));
                  },
                  child: Text("Navigate to a new screen and back"),
                ),

//            Send data to a new screen
                Container(
                  width: 200,
                  child: TextField(
                    controller: msgController,
                    decoration: InputDecoration(
                        hintText: 'message'
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PageC(msg:msgController.text)));
                  },
                  child: Text("Send data to a new screen"),
                ),

//            Return data from a screen
                Container(
                    width: 200,
                    child: Text("data from pageD:"+backData)
                ),
                RaisedButton(
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      // We'll create the SelectionScreen in the next step!
                      MaterialPageRoute(builder: (context) => PageD()),
                    );
                    setState((){
                      backData = result;
                    });
                  },
                  child: Text("Return data from a screen"),
                ),

//            Navigate with named routes
                RaisedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/mystatefulidget');
                  },
                  child: Text("Navigate with named routes"),
                ),

//            Animating a widget across screens
                RaisedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>PageE()));
                  },
                  child: Text("Animating a widget across screens"),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}

//normal back
class PageB extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('pageB'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text("back"),
            )
          ],
        ),
      ),
    );
  }
}

//receive data
class PageC extends StatelessWidget{

  final String msg;

  PageC({Key key, @required this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('pageC'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('msg:'+msg),
            RaisedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text("back"),
            )
          ],
        ),
      ),
    );
  }
}

//Return data
class PageD extends StatelessWidget{
  TextEditingController msgController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageD'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
                child: TextField(
                  controller: msgController,
                  decoration: InputDecoration(
                      hintText: 'back message'
                  ),
                ),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.pop(context,msgController.text);
              },
              child: Text("back"),
            )
          ],
        ),
      ),
    );
  }
}

// Animating a widget across screens
class PageE extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
            child: Hero(
              tag: 'imageHero',
              child: Image.asset('assets/lake.jpg'),
            )
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}