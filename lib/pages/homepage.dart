import 'package:flutter/material.dart';
import 'package:projone/widgets/drawer.dart';

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

    return Scaffold(
      appBar: AppBar(
        title: Text("Catalogue app"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to my  $hel house bitches !!!! $two $four"+" "+three +" $istrue"),

        ),
      ),
      drawer: Mydrawer(),
    );
  }
}
