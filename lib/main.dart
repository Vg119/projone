import 'package:flutter/material.dart';
import 'package:projone/homepage.dart';

void main(){    //entry point of app
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);   // when data is passed onto app

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
        home: Homepage(),
    );
  }
}


