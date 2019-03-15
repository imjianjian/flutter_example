import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_example/Components/PageTemplates/SinglelPageTemplate.dart';
import 'package:dio/dio.dart';

class HttpPage extends StatefulWidget{

  @override
  State createState() {
    return HttpPageState();
  }
}

class HttpPageState extends State<HttpPage>{

  String _url = 'https://www.example.com';
  String _response ='';

  HttpclientGet() async {
    Uri uri=Uri.parse(_url);
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.getUrl(uri);
    HttpClientResponse response = await request.close();
    String responseBody = await response.transform(utf8.decoder).join();
    httpClient.close();
    return responseBody;
  }

  @override
  Widget build(BuildContext context) {
    var _textController = TextEditingController();
    return SinglePage(
      title: "Httpclient & Dio",
      body:SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                  width: 300,
                  height: 300,
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.amber,width: 3)
                  ),
                  child: SingleChildScrollView(
                    child: Text(_response),
                  )
              ),
              Container(
                width: 200,
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    hintText: _url,
                  ),
                ),
              ),
              RaisedButton(
                child: Text('HttpClient send'),
                onPressed: () async {
                  String responseBody ='';
                  try{
                    setState(() {
                      _response = 'sending...';
                    });
                    Uri uri=Uri.parse(_textController.value.text==''?_url:_textController.value.text);
                    HttpClient httpClient = new HttpClient();
                    HttpClientRequest request = await httpClient.getUrl(uri);
                    HttpClientResponse response = await request.close();
                    responseBody = await response.transform(utf8.decoder).join();
                    httpClient.close();
                  }catch(e){
                    setState(() {
                      _response = e.toString();
                    });
                  }finally{
                    setState(() {
                      _response = responseBody;
                    });
                  }

                },
              ),
              RaisedButton(
                child: Text('Dio send'),
                onPressed: () async{
                  String responseBody='';
                  try{
                    setState(() {
                      _response = 'sending...';
                    });
                    Dio dio = new Dio();
                    Response response;
                    response=await dio.get(_textController.value.text==''?_url:_textController.value.text);
                    responseBody = response.data.toString();
                  }catch(e){
                    setState(() {
                      _response = e.toString();
                    });
                  }finally{
                    setState(() {
                      _response =responseBody;
                    });
                  }
                },
              )
            ],
          ),
        ),
      )
    );
  }
}