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
    await Future.delayed(Duration(seconds: 5));   //to  show loading circle at beginning
    var catalog_json_data = await rootBundle.loadString("assets/files/Catalog.json");      //async-await coz this takes time load(returns Future type of data.
    var decoded_data = jsonDecode(catalog_json_data); // the data in catalog_json_data is  String . jsonDecodeconvert from String to map(dynamic) ; jsonEncode does the reverse
    var data = decoded_data["products"]; //to get only items with key "products" from decoded_data.
    print(Catalog.item.length);

    Catalog.item = List.from(data).map<Myitems>((items) => Myitems.fromMap(items)).toList(); //this basicaaly makes a list of all the items but each item is an object of Myitems
    setState(() {    //after loading the entire list we need to change the state for changing the widget and call the build again

    });
  }

  Widget build(BuildContext context) {
    //common data types
    int hel = 7;double four = 9.65;
    String two = "test",three = "three";
    bool istrue  = true;
    num a = 34;

    var gen = "hello";
    const constant = "hej"; //can be constant of any type

   // List dummyList = List.generate(5, (index) => Catalog.item[0]);  //List.generate generates a list having same five members(five is the length specified and can be changed)
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalogue app"),
      ),
      body: Padding(  //to give padding to list
        padding: const EdgeInsets.all(8.0),
        child: (Catalog.item.length!=0)?
        // ListView.builder(    //makes a listview for items to be displayed . Listview is used to make a listview such that a view only the items presently seen on the screen r rendered along with +-2 items below and above
        //   itemCount: Catalog.item.length,  // no of items
        //   itemBuilder: (context,index){
        //     return ItemWidget(
        //         item:Catalog.item[index]   //this.item in ItemWidget constructor is named . Also this is the item widget to be displayed by lsitview builder.
        //     );
        //   }
        // )
        GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2  ,                     //sliver is something all scrollable content have . crossaxis here is the row , since we are dealing with grid so no of elements in row is 2
             mainAxisSpacing: 10
            ),
            itemBuilder: (context,index){
              final item = Catalog.item[index];
              return Card
                (clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14)
              ),

                  child: GridTile(   //each grid element's design
                      header: Container(
                          color: Colors.purple,
                          child: Text(item.name,
                          style: TextStyle(color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),)),
                      child : Image.network(item.image),
                      footer: Container(
                          color: Colors.deepOrange,
                          child: Text(item.price.toString(),
                          style: TextStyle(color: Colors.black,
                                 fontWeight: FontWeight.bold,
                                 fontSize: 25),)
                      ),
                  )
              );
            },
        itemCount: Catalog.item.length,)
            :
            Center(
              child: CircularProgressIndicator(),    //at the beginning when this the length of items array is 0 , then this shows circular loading widget becoz we gave a delay of 5 sec at loaddata
            )
      ),
      drawer: Mydrawer(),
    );
  }
}
