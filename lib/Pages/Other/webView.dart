import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter_example/Components/PageTemplates/SinglelPageTemplate.dart';

class myWebView extends StatefulWidget{

  @override
  State createState() {
    return myWebViewState();
  }
}

class myWebViewState extends State<myWebView>{

  String _url = "https://www.baidu.com";

  var _controller = TextEditingController();

  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  load(){
    flutterWebviewPlugin.reloadUrl(_controller.value.text);
  }

  goBack(){
    flutterWebviewPlugin.goBack();
  }

  goForward(){
    flutterWebviewPlugin.goForward();
  }

  refresh(){
    flutterWebviewPlugin.reload();
  }

  @override
  Widget build(BuildContext context) {
    return SinglePage(
        title: 'WebView',
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(8.0, 1.0, 8.0, 1.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: TextField(
                          controller: _controller,
                          onEditingComplete: ()=>load(),

                        )
                    ),
                    Container(
                      child: FlatButton(
                        child: Icon(Icons.keyboard_arrow_left),
                        onPressed: ()=>goBack(),
                      ),
                      width: 40,
                    ),
                    Container(
                      child: FlatButton(
                        child: Icon(Icons.keyboard_arrow_right),
                        onPressed: ()=>goForward(),
                      ),
                      width: 40,
                    ),
                    Container(
                      child: FlatButton(
                        child: Icon(Icons.refresh),
                        onPressed: ()=>refresh(),
                      ),
                      width: 40,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: WebviewScaffold(url: _url),
                flex: 1,
              )
            ],
          ),
        )
    );
  }
}