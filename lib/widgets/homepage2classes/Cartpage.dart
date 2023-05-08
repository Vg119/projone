import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projone/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: "Cart items".text.xl5.make().centered(),
      ),

      body: Column(
        children: [
          Cartlist().px32().expand(),  //a widget that is used to hold space for a widget that will be made in the future
          Divider(),
          _Carttotal(),
        ],
      ),

    );
  }
}

class _Carttotal extends StatelessWidget {    //a customised widget that displays price and buy button
  const _Carttotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$9999".text.xl5.color(context.theme.accentColor).make(),
          100.widthBox,
          ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: 
                  MaterialStateProperty.all(context.theme.buttonColor)
              ),
              child: "Buy".text.white.make()).w32(context)
        ],
      ),
    );
  }
}

class Cartlist extends StatefulWidget {
  const Cartlist({Key? key}) : super(key: key);

  @override
  State<Cartlist> createState() => _CartlistState();
}

class _CartlistState extends State<Cartlist> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 6,
        itemBuilder: (context,index)=> ListTile(
          leading: Icon(Icons.check_box),
          title : 'Item ${index+1}'.text.make(),
          trailing: Icon(Icons.remove_circle),
        )
    );
  }
}


