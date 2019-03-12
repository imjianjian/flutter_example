import 'package:flutter/material.dart';

class HeroPageOne extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Animation'),
      ),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 100,
                    child:  GestureDetector(
                        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>HeroPageTwo(Tag:'hero1',Img:'assets/hero1.jpg')));},
                        child: Hero(tag: 'hero1', child:Image.asset('assets/hero1.jpg'))
                    ),
                  ),
                  Container(
                    width: 100,
                    child:  GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>HeroPageTwo(Tag:'hero2',Img:'assets/hero2.jpg')));
                        },
                        child: Hero(
                            tag: 'hero2', child:Image.asset('assets/hero2.jpg')
                        )
                    ),
                  ),
                  Container(
                    width: 100,
                    child:  GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>HeroPageTwo(Tag:'hero3',Img:'assets/hero3.jpg')));
                        },
                        child: Hero(
                            tag: 'hero3', child:Image.asset('assets/hero3.jpg')
                        )
                    ),
                  ),
                ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(15.0),
                  child: Text('click image',
                      style: TextStyle(
                          fontSize: 30
                      )),
                )
              ],
            )
          ],
        )
      ),
    );
  }
}

class HeroPageTwo extends StatelessWidget{
  String Tag;
  String Img;
  HeroPageTwo({Key key,@required this.Tag,@required this.Img}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(tag: Tag, child: Image.asset(Img))
        )
      ),
    );
  }
}