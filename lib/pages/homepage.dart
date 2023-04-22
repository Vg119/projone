import 'package:flutter/material.dart';
import 'package:projone/Catalog.dart';
import 'package:projone/widgets/drawer.dart';

import '../widgets/item_widget.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //common data types
    int hel = 7;double four = 9.65;
    String two = "test",three = "three";
    bool istrue  = true;
    num a = 34;

    var gen = "hello";
    const constant = "hej"; //can be constant of any type

    List dummyList = List.generate(5, (index) => Catalog.item[0]);  //List.generate generates a list having same five members(five is the length specified and can be changed)
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalogue app"),
      ),
      body: Padding(  //to give padding to list
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(    //makes a listview for items to be displayed . Listview is used to make a listview such that a view only the items presently seen on the screen r rendered along with +-2 items below and above
          itemCount: dummyList.length,  // no of items
          itemBuilder: (context,index){
            return ItemWidget(
                item:dummyList[index]   //this.item in ItemWidget constructor is named . Also this is the item widget to be displayed by lsitview builder.
            );
          }
        ),
      ),
      drawer: Mydrawer(),
    );
  }
}
