import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projone/utils/routes.dart';
import 'package:projone/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';   //ui using velocity x

import '../Catalog.dart';
import '../widgets/homepage2classes/CatalogList.dart';
import '../widgets/homepage2classes/Columnchilderen.dart';

class Homepage2 extends StatefulWidget {
  const Homepage2({Key? key}) : super(key: key);

  @override
  State<Homepage2> createState() => _Homepage2State();
}

class _Homepage2State extends State<Homepage2> {

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
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Mytheme.cream,
       floatingActionButton: FloatingActionButton(
         onPressed: () =>
         {
           Navigator.pushNamed(context, Myroutes.cart)    //navigates to cartpage
         },
         child: Icon(CupertinoIcons.cart),
         backgroundColor: Mytheme.darkbluecolor,
       ),
       body: SafeArea(    //safe area means leaving area of the battery(top) and bottom of screen
         child: Container(
           padding: Vx.m32,   //padding
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Columnchilderen(),
               SizedBox(height: 10),
               if(Catalog.item!=null && Catalog.item.isNotEmpty)    //if not empty then displaying list
                  CatalogList()
                else
                  CircularProgressIndicator().centered().expand()



             ],
           ),
         ),
       ),

     );
  }
}






