import 'package:flutter/material.dart';
import 'package:projone/pages/homepage.dart';
import 'package:projone/pages/loginpage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projone/utils/routes.dart';

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
      theme: ThemeData(     //Thememode.light defined
        primarySwatch: Colors.deepOrange,
        fontFamily: GoogleFonts.lato().fontFamily,   //setting style of app texts
      ),
      darkTheme: ThemeData(    //Thememode.dark defined
        brightness: Brightness.dark
      ),
  initialRoute: Myroutes.homepg,   //setting initialroute to "/home" , by default set to "/"
   routes: {
          Myroutes.login:(context) =>  Loginpage(),   // writing new LoginPage and LoginPage is same .
          Myroutes.homepg : (context) => Homepage()

   },
    );
  }


  void method({ required bool isTrue  ,int a=9})
  {

  }
}


