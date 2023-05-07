import 'package:flutter/material.dart';
import 'package:projone/pages/Homepage2.dart';
import 'package:projone/pages/homepage.dart';
import 'package:projone/pages/loginpage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projone/utils/routes.dart';
import 'package:projone/widgets/themes.dart';

void main(){    //entry point of app , not in any class
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);   // when data is passed onto app

  @override
  Widget build(BuildContext context) {

    method(isTrue: false);

    return MaterialApp(
        //home: Homepage(),
      themeMode: ThemeMode.light,
      theme: Mytheme.lighttheme(context),   //taking theme from themes.dart (Mytheme class)
      initialRoute: Myroutes.homepg2,   //setting initialroute to "/home" , by default set to "/"
   routes: {
          Myroutes.login:(context) =>  Loginpage(),   // writing new LoginPage and LoginPage is same .
          Myroutes.homepg : (context) => Homepage(),
          Myroutes.homepg2 : (context) => Homepage2()


   },
    );
  }


  void method({ required bool isTrue  ,int a=9})
  {

  }
}


