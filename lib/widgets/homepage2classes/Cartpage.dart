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

    );
  }
}
