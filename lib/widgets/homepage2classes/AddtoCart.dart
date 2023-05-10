import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Cartmodel.dart';
import '../../Catalog.dart';

class Addtocart extends StatefulWidget {   //add to cart is a stateful widget as when we click on it it becomes a check sign
  final Myitems item;
  const Addtocart({
    super.key, required this.item,
  });

  @override
  State<Addtocart> createState() => _AddtocartState(item);
}

class _AddtocartState extends State<Addtocart> {
  CartModel cartModel = CartModel();
  Myitems item ;


  _AddtocartState(this.item);

  @override
  Widget build(BuildContext context) {
    bool is_added = cartModel.cartitems.contains(item) ?? false;
    return ElevatedButton(   //a button
        onPressed: () {
          if(!is_added) {
            is_added = is_added
                .toggle(); // make the boolean reverse of initial value , true if false and vice versa
            Catalog catalog = Catalog();

            cartModel.catalog = catalog;
            cartModel.add(item);
            setState(() { //recall the build() for changing state

            });
          }
          else
            {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Already added".text.make()));
            }
        },
        style: ButtonStyle(    //setting button style
          //  backgroundColor: MaterialStateProperty.all(Mytheme.darkbluecolor),
            backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
            shape: MaterialStateProperty.all(StadiumBorder())
        ),

        child : is_added?Icon(Icons.check):Icon(CupertinoIcons.cart_badge_plus)  // if already added then show check else shoe text

    );
  }
}
