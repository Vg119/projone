import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projone/Cartmodel.dart';
import 'package:projone/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:projone/Catalog.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        title: "Cart items".text.xl5.make().centered(),
      ),

      body: Column(
        children: [
          Cartlist().px32().expand(),  //a widget that is used to hold space for a widget that will be made in the future
          Divider(),
          _Carttotal(),
        ],
      ),

    );
  }
}

class _Carttotal extends StatelessWidget {    //a customised widget that displays price and buy button
  final _cart = new CartModel();   //obj of cartmodel

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice()}".text.xl5.color(context.theme.accentColor).make(),    //displays total price
          100.widthBox,
          ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Buyimg not supported".text.make()));  //scaffoldmessenger shows snackbar at bottom and top of screen
              },
              style: ButtonStyle(
                backgroundColor: 
                  MaterialStateProperty.all(context.theme.buttonColor)
              ),
              child: "Buy".text.white.make()).w32(context)
        ],
      ),
    );
  }
}

class Cartlist extends StatefulWidget {
  const Cartlist({Key? key}) : super(key: key);

  @override
  State<Cartlist> createState() => _CartlistState();
}

class _CartlistState extends State<Cartlist> {
  final _cart = new CartModel();
  @override
  Widget build(BuildContext context) {
    return _cart.cartitems.isEmpty?("Empty cart".text.xl5.make().centered()):ListView.builder(   //if empty display text
        itemCount: _cart.cartitems.length,
        itemBuilder: (context,index)=> ListTile(
          leading: Icon(Icons.check_box),
          trailing: IconButton(
            icon : Icon(Icons.remove_circle),
          onPressed: ()     //on pressing - the item is removed from cartmodel 's list
            {
                _cart.remove(_cart.cartitems[index]);
                setState(() {

                });
            },
          ),

          title: Text(_cart.cartitems[index].name),//to display each item of cart model
        )
    );
  }
}


