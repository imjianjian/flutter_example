import 'package:flutter/material.dart';
import 'package:flutter_example/Model/CartModel.dart';
import 'package:provide/provide.dart';

class CartPage extends StatefulWidget{

  @override
  State createState() {
    return CartPageState();
  }
}

class CartPageState extends State<CartPage>{

  _createCartList(context){

    List<Widget> _list = [];

    var cartModule = Provide.value<CartModel>(context);

    List<CartItem> Cart = cartModule.getCart();

    for(int i =0;i<Cart.length;i++){
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
                  Text(Cart[i].name,
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.blueGrey
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.all(12.0),
                child: Text("￥"+Cart[i].price.toString(),
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],
          )
      );
    }

    return _list;
  }

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body:ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Column(
                children: _createCartList(context)
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                height: 50,
                color: Colors.blue,
                padding: EdgeInsets.all(13.0),
                child: Text("totalPrice:  "+Provide.value<CartModel>(context).getTotalPrice().toString(),
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.white
                  ),
                ),
              ),
            )
          ],
        )
      )
    );
  }
}