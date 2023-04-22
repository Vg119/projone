import 'package:flutter/material.dart';
import 'package:projone/Catalog.dart';

class ItemWidget extends StatelessWidget {  //makes each item widget to be displayes by listview builder
  final Myitems item;

  const ItemWidget({required this.item});    //this.item is required and is named too

  @override
  Widget build(BuildContext context) {
    return Card(

      child: ListTile(   //makes a list
        onTap: () {     //on pressing the item this happens
          print("${item.name} pressed");
        },
        leading: Image.network(item.image), //1st thing to be shown
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text("\$${item.price}",  //last thing to be shown
        textScaleFactor: 1.5,
        style: TextStyle(
          color: Colors.black38,
          fontWeight: FontWeight.bold
        ),),  //\$ to give dollar sign
      ),
    );
  }
}
