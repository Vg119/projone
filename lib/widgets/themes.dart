import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class Mytheme{
  static ThemeData lighttheme(BuildContext context) =>   //1st theme
      ThemeData(
          primarySwatch: Colors.deepOrange, //primary swatch is for setting a definite range of colours to be used for different widgets unlike primary colour which is exactly one shade of swatch
          canvasColor: Colors.cyanAccent,
          cardColor: Colors.white,
          buttonColor: darkbluecolor,
          fontFamily: GoogleFonts.lato().fontFamily,   //setting style of app texts

          appBarTheme: AppBarTheme(     //the app bar's them
            color: Colors.grey,
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.black),  //for the icon
            toolbarTextStyle: Theme.of(context).textTheme.bodyMedium, titleTextStyle: Theme.of(context).textTheme.titleLarge,  //for the text

          )

      );

     static ThemeData darktheme(BuildContext context) =>     //2nd theme
       ThemeData(

           brightness: Brightness.dark,   //setting automatically dark system features
           canvasColor: dark,
           cardColor: Colors.white24,
           buttonColor: Colors.lightBlueAccent,
           primarySwatch: Colors.grey, //primary swatch is for setting a definite range of colours to be used for different widgets unlike primary colour which is exactly one shade of swatch
           fontFamily: GoogleFonts.lato().fontFamily,  //setting style of app texts

           appBarTheme: AppBarTheme(     //the app bar's them
             color: Colors.blueAccent,
             elevation: 0.0,
             iconTheme: IconThemeData(color: Colors.white) ,//for the icon
             toolbarTextStyle: Theme.of(context).textTheme.bodyMedium, titleTextStyle: Theme.of(context).textTheme.titleLarge,  //for the text

           )


       );

     static Color darkbluecolor  = Color(0xFF00008b);  //8 digit hex code to be used with 0xFF
     static Color cream = Color(0xFFFFFDD0);
     static Color dark = Vx.gray900;
     static Color light = Vx.amber50;
}