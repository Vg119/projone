import 'package:flutter/material.dart';

class Loginpage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Material(
      color: Colors.white,      //white to match image to background
      child: SingleChildScrollView(  //singlechildscrollview to make sure image fits in .
        child: Column(

          children: [
            Image.asset("assets/images/login.png",height: 350), //Boxfit.cover to fit the image
            SizedBox(height: 20),      //empty space of ht 20
            Text("Welcome",
            style: TextStyle(
              fontSize: 25,
              fontStyle: FontStyle.normal
            ),),
            SizedBox(height: 20), //empty space of ht 20
            Padding(
              padding: const EdgeInsets.symmetric(vertical:16.0,horizontal: 32.0),   //horizontal and vertical column different
              child: Column(children: [TextFormField(   //childen are 2 textformfields
                decoration: InputDecoration(
                    hintText: "Enter user name",
                    labelText: "Username"
                ),
              ),
                TextFormField(
                  obscureText : true,
                  decoration: InputDecoration(
                      hintText: "Enter password",
                      labelText: "Password"
                  ),
                ),
                SizedBox(height: 20),
              ElevatedButton(
                child: Text("LOGIN"),
                style: TextButton.styleFrom(),
                onPressed: (){
                  print("hello vergab");
                },
              )
              ],),
            )
          ],

        ),
      ),
    );
  }
}
