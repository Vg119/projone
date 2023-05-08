import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Catalog.dart';
import '../themes.dart';

class Catalogitem extends StatelessWidget {    //makes each object to be displayed in list
  final Myitems item;

  const Catalogitem({super.key, required this.item})
      :
        assert(item!=null);   //item if null gives error




  @override
  Widget build(BuildContext context) {
    return VxBox(


      child: Row(    //making a row
        children: [    //children of row
          Hero(tag: Key(item.id.toString()),    //hero animation , tag to be same where the destination of animation too.here homedetailspage
              child: Image.network(item.image).box.p8.rounded.color(Mytheme.cream).make().p16().w40(context)),    //1st thing to be displayed
          Column(
            mainAxisAlignment: MainAxisAlignment.center,    //main axis of column is vertical ,cross is horizontal
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              item.name.text.bold.xl2.make(),
              // item.desc.text.textStyle(context.captionStyle).make(),
              Text(item.desc,
                softWrap: true,),
              10.heightBox,    //sizedbox of 10 size
              ButtonBar( // a widget
                  children :[
                    "\$${item.price}".text.make(),    //a text
                    ElevatedButton(   //a button
                        onPressed: () {},
                        style: ButtonStyle(    //setting button style
                            backgroundColor: MaterialStateProperty.all(Mytheme.darkbluecolor),
                            shape: MaterialStateProperty.all(StadiumBorder())
                        ),

                        child : "Add to cart".text.make()   //text of button

                    )
                  ] ).pOnly(right: 8.0)
              //give padding to right of 8

            ],
          )
        ],
      ),

    ).white.rounded.square(100).make().py16();
    //py means padding in y axis,rounded means rounded edges

  }
}
