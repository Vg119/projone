import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mytheme{
  static ThemeData lighttheme(BuildContext context) =>   //1st theme
      ThemeData(
          primarySwatch: Colors.deepOrange, //primary swatch is for setting a definite range of colours to be used for different widgets unlike primary colour which is exactly one shade of swatch
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
           brightness: Brightness.dark,
           primarySwatch: Colors.grey, //primary swatch is for setting a definite range of colours to be used for different widgets unlike primary colour which is exactly one shade of swatch
           fontFamily: GoogleFonts.amaranth().fontFamily,  //setting style of app texts

           appBarTheme: AppBarTheme(     //the app bar's them
             color: Colors.blueAccent,
             elevation: 0.0,
             iconTheme: IconThemeData(color: Colors.brown) ,//for the icon
             toolbarTextStyle: Theme.of(context).textTheme.bodyMedium, titleTextStyle: Theme.of(context).textTheme.titleLarge,  //for the text

           )


       );
}