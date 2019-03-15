import 'package:flutter/material.dart';
import 'package:flutter_example/Components/PageTemplates/SinglelPageTemplate.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class IO extends StatefulWidget{

  @override
  State createState() {
    return IOState();
  }
}


class IOState extends State<IO>{

  String _readText = '';
  var _controller = TextEditingController();

  read() async{
    String dir = (await getApplicationDocumentsDirectory()).path;
    new File("$dir/file.txt").readAsString().then((String contents) {
      setState(() {
        _readText = contents;
      });
    });
  }

  write() async{
    String text = _controller.value.text;

    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = new File('$dir/file.txt');
    var sink = file.openWrite();
    sink.write(text);
    sink.close();
  }

  @override
  Widget build(BuildContext context) {
    return SinglePage(
        title: 'Dart IO',
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                TextField(
                  maxLines:10,
                  controller: _controller,
                ),
                RaisedButton(
                  child: Text('write file'),
                  onPressed: ()=>write(),
                ),
                RaisedButton(
                  child: Text('read file'),
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
