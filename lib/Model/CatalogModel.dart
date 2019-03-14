import 'package:flutter/material.dart';

class CatalogItem{
  String name;
  double price;
  bool isSeal;
  CatalogItem({this.name,this.price,this.isSeal=false});
}

class CatalogModel extends ChangeNotifier{

  List<CatalogItem> _catalogList=[];

  seal(String name){
    bool flag = false;
    for(int i =0;i<_catalogList.length;i++){
      if(_catalogList[i].name == name){
          _catalogList[i].isSeal = !_catalogList[i].isSeal;
          flag=_catalogList[i].isSeal;
      }
    }
    notifyListeners();
    return flag;
  }

  reset(){
    for(int i =0;i<_catalogList.length;i++){
        _catalogList[i].isSeal = false;
    }
    notifyListeners();
  }

  addToCatalog(CatalogItem item){
    _catalogList.add(item);
    notifyListeners();
  }

  getCatalog()=>_catalogList;
}

