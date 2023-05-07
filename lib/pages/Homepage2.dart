import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projone/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';   //ui using velocity x

import '../Catalog.dart';

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
                  Center(
                    child : CircularProgressIndicator()
                  )



             ],
           ),
         ),
       ),

     );
  }
}

class Columnchilderen extends StatelessWidget {             //for displaying 2 texts
  const Columnchilderen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalogue app".text.xl5.bold.color(Mytheme.darkbluecolor).make(),   //how to make text in velocity x
        "Trending products".text.xl2.make()


      ],
    );
  }
}


class CatalogList extends StatelessWidget {       //makes the list of elements
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: Catalog.item.length,
          itemBuilder: (context,index){
          final catalogitem = Catalog.item[index];
          return Catalogitem(item :catalogitem);
      }),
    );
  }
}

class Catalogitem extends StatelessWidget {    //makes each object to be displayed in list
  final Myitems item;

  const Catalogitem({super.key, required this.item})
   :
      assert(item!=null);   //item if null gives error




  @override
  Widget build(BuildContext context) {
    return VxBox(

      child: Row(
        children: [
          Image.network(item.image).box.p8.rounded.color(Mytheme.cream).make().p16().w40(context),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              item.name.text.bold.xl2.make(),
              item.desc.text.textStyle(context.captionStyle).make(),
              10.heightBox,    //sizedbox of 10 size
              ButtonBar( // a widget
                children :[
                "\$${item.price}".text.make(),
                ElevatedButton(
                  onPressed: () {},
                   style: ButtonStyle(    //setting button style
                     backgroundColor: MaterialStateProperty.all(Mytheme.darkbluecolor),
                     shape: MaterialStateProperty.all(StadiumBorder())
                   ),

                  child : "Buy".text.make()   //text of button

                )
             ] ).pOnly(right: 8.0)
                                    //give padding to right of 8

            ],
          )
        ],
      )
    ).white.rounded.square(100).make().py16();
                                         //py means padding in y axis,rounded means rounded edges

  }
}



