import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projone/Catalog.dart';
import 'package:velocity_x/velocity_x.dart';

import '../themes.dart';

class Homedetailpage extends StatelessWidget {
  //this opens when any item is tapped upon
  final Myitems item;

  const Homedetailpage({super.key, required this.item})
      :
        assert(item != null);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ), //to give back button in appbar
      bottomNavigationBar: Container( //for at navigation at the bottom

          child: ButtonBar( // a widget , same button bar from Catalogitem
              alignment: MainAxisAlignment.start,
              children: [
                "\$${item.price}".text.xl5.make(), //a text
                650.widthBox, //give a horizontal sized box of size 900
                ElevatedButton( //a button
                    onPressed: () {},
                    style: ButtonStyle( //setting button style
                        backgroundColor: MaterialStateProperty.all(
                            Mytheme.darkbluecolor),
                        shape: MaterialStateProperty.all(StadiumBorder())
                    ),

                    child: "Add to cart".text.make() //text of button

                ).wh(120, 50)
              ]).p32()
      ),
      body: SafeArea(
        bottom: false,
        // safe area wont be maintained at the bottom , only maintained at top now

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(tag: Key(item.id.toString()),
                //hero coming from catalogitem , on clicking an item
                child: Image.network(item.image).centered().py4()),

            Expanded(
                child: VxArc( //a type of widget to give convex/concave effect to edges
                  height: 30.0,
                  arcType: VxArcType.CONVEY,
                  edge: VxEdge.TOP,
                  child: Container(
                    color: Colors.white,
                    width: context.screenWidth,
                    child: Column(
                      children: [
                        item.name.text.bold.xl6.make(),
                        item.desc.text.textStyle(context.captionStyle).make(),
                      ],
                    ).py64(),
                  ),
                )),
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
                " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"
                " when an unknown printer took a galley of type and scrambled it to make a type "
                "specimen book. It has survived not only five centuries, but also the leap into "
                "electronic typesetting, remaining essentially unchanged. It was popularised in the "
                "1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently"
                " with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum "
                .text.textStyle(context.captionStyle).make().p16()
          ],
        ),
      ),
    );
  }
}
