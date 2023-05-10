import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';


import '../../Cartmodel.dart';
import '../../Catalog.dart';
import '../../Mystore.dart';

class Addtocart extends StatefulWidget {
  //add to cart is a stateful widget as when we click on it it becomes a check sign
  final Myitems item;

  const Addtocart({
    super.key,
    required this.item,
  });

  @override
  State<Addtocart> createState() => _AddtocartState();
}

class _AddtocartState extends State<Addtocart> {
  //CartModel cartModel = CartModel(); //cart model's singleton object
  @override
  Widget build(BuildContext context) {
    VxState.watch(context,on : [Addcartmutation]);   //re render widget on  particular mutation (mutation means action) ; addcartmutation defined later
    final cartModel = (VxState.store as Mystore).cartModel;   //takimg vx store's cart model
    bool is_added = cartModel.cartitems.contains(widget.item); //checks if item is present in cartmodel's list
    return ElevatedButton(
        //a button
        onPressed: () {
          if (is_added == false) {
            //if not added then perform this
             is_added = is_added
                .toggle(); // make the boolean reverse of initial value , true if false and vice versa
            final catalog = (VxState.store as Mystore).catalog;   //takimg vx store's catalog

            cartModel.catalog = catalog;// already done in Mystore
            cartModel.add(widget.item); //as we add mutation
            //Addcartmutation(item);
            setState(() {             //recall the build() for changing state

            });
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: "Item already added"
                    .text
                    .make())); //if already added display snackbar
          }
        },
        style: ButtonStyle(
            //setting button style
            //  backgroundColor: MaterialStateProperty.all(Mytheme.darkbluecolor),
            backgroundColor:
                MaterialStateProperty.all(context.theme.buttonColor),
            shape: MaterialStateProperty.all(StadiumBorder())),
        child: is_added
            ? Icon(Icons.check)
            : Icon(CupertinoIcons
                .cart) // if already added then show check else shoe text

        );
  }
}
