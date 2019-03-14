import 'package:flutter/material.dart';
import 'package:flutter_example/Pages/ScopedModel/CartPage.dart';
import 'package:flutter_example/Model/CartModel.dart';
import 'package:flutter_example/Model/CatalogModel.dart';
import 'package:provide/provide.dart';

class CatalogPage extends StatefulWidget{

  @override
  State createState() {
    return CatalogPageState();
  }
}

class CatalogPageState extends State<CatalogPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('Catalog'),
            actions: <Widget>[
              FlatButton(
                child: Icon(Icons.fastfood,color: Colors.white),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));
                },
              ),
            ],
          ),
          body:ListView(
                children: <Widget>[
                  _ListItem(),
                ],
              )
    );
  }
}


class _ListItem extends StatefulWidget{

  @override
  State createState() {
    return _ListItemState();
  }
}

class _ListItemState extends State<_ListItem>{


  CreateCatalogList(context){

    var catalogModel = Provide.value<CatalogModel>(context);
    var cartModule = Provide.value<CartModel>(context);

    List<CatalogItem> _catalogList = catalogModel.getCatalog();

    List<Widget> _list = [];

    for(int i=0;i<_catalogList.length;i++){
      _list.add(
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: 50,
                  height: 50,
                  color: Color.fromARGB(255, i*50, 100, 100),
                  margin: EdgeInsets.all(15.0),
                ),
                Text(_catalogList[i].name,
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.blueGrey
                  ),
                )
              ],
            ),
            Provide<CatalogModel>(
              builder: (context,child,catalog){
               return FlatButton(
                 //            child: _catalogList[i].isSeal? Icon(Icons.done):Text('ADD'),
                 child: _catalogList[i].isSeal? Icon(Icons.done):Text('ADD'),
                 onPressed: (){
                   bool isSeal = catalogModel.seal(_catalogList[i].name);
                   if(isSeal){
                     cartModule.addToCart(CartItem(name: _catalogList[i].name,price: _catalogList[i].price));
                   }else{
                     cartModule.delFromCart(name: _catalogList[i].name);
                   }
                   List<CartItem> cart = cartModule.getCart();
                   print(cart.length);
                 },
               );
              },
            )
          ],
        )
      );
    }

    return _list;
  }

  @override
  Widget build(BuildContext context) {

    return ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: double.infinity,
              minHeight: 80,
            ),
            child:Column(
              children:CreateCatalogList(context),
            )
    );
  }
}