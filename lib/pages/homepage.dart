import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projone/Catalog.dart';
import 'package:projone/widgets/drawer.dart';

import '../widgets/item_widget.dart';

class Homepage extends StatefulWidget {   //we make homepage a stateful widget as we have to get info from catalog.json and get info and update homepage
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {     //this init is called before build is called
    // TODO: implement initState
    super.initState();
    loaddata();
  }
  loaddata() async
  {
    var catalog_json_data = await rootBundle.loadString("assets/files/Catalog.json");      //async-await coz this takes time load(returns Future type of data.
    var decoded_data = jsonDecode(catalog_json_data); // the data in catalog_json_data is  String . jsonDecodeconvert from String to map(dynamic) ; jsonEncode does the reverse
    var data = decoded_data["products"]; //to get only items with key "products" from decoded_data.
   // print(decoded_data);
  }

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
