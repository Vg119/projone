import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

import '../themes.dart';

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