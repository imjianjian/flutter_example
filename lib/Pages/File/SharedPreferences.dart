import 'package:flutter_example/Components/PageTemplates/SinglelPageTemplate.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';


class mySharedPreferences extends StatefulWidget{

  @override
  State createState() {
    return SharedPreferencesState();
  }
}

class SharedPreferencesState extends State<mySharedPreferences>{

  String _readText = '';
  var _controller = TextEditingController();

  read() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() => _readText = prefs.getString('text'));
  }

  write() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String text = _controller.value.text;
    await prefs.setString('text', text);
  }

  @override
  Widget build(BuildContext context) {
    return SinglePage(
        title: 'shared_preferences',
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                TextField(
                  maxLines:10,
                  controller: _controller,
                ),
                RaisedButton(
                  child: Text('write shared_preferences'),
                  onPressed: ()=>write(),
                ),
                RaisedButton(
                  child: Text('read shared_preferences'),
                  onPressed: ()=>read(),
                ),
                SingleChildScrollView(
                  child: Container(
                    child: Text(_readText),
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.amber,width: 5)
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}