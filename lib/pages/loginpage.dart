import 'package:flutter/material.dart';
import 'package:projone/pages/homepage.dart';
import 'package:projone/utils/routes.dart';

class Loginpage extends StatefulWidget {
  //1st class of stateful widget

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  //2nd class of stateful widget, _ means private
  String txt = "";
  bool changebutton = false;

  final _formkey = GlobalKey<FormState>();  //formkey

  void movetoNext(BuildContext context) async {
    if(_formkey.currentState!.validate()) {       //if validated by both textform fields then do this or the respective msg is displayed
      setState(() {
        //as when we press the button , the buttons state changes hence setstate
        changebutton =
        true; //setting this true ,so that the colour and roundercorner radius of container changes
      });

      await Future.delayed(Duration(
          seconds:
          1)); //async await means on tapping after set state , waits for 1 sec and then goes to homepage

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Homepage())); //to navigate to homepage , context is retreived from build
    }

  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white, //white to match image to background
      child: SingleChildScrollView(
        //singlechildscrollview to make sure image fits in .
        child: Form(     //now everything inside is related to form
          key: _formkey,   //setting formkey
          child: Column(
            children: [
              Image.asset("assets/images/login.png", height: 350),
              //Boxfit.cover to fit the image

              SizedBox(height: 20),
              //empty space of ht 20

              Text(
                "Welcome $txt",
                style: TextStyle(fontSize: 25, fontStyle: FontStyle.normal),
              ),

              SizedBox(height: 20),
              //empty space of ht 20

              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                //horizontal and vertical column different
                child: Column(
                  children: [
                    TextFormField(
                      //childen are 2 textformfields
                      decoration: InputDecoration(
                          hintText: "Enter user name", labelText: "Username"),
                      onChanged: (value) {
                        //onChanged gives access to strings on Textformfield
                        txt =
                            value; //value that the user enters is added to after Welcome
                        setState(() {
                          //recalls the build() as this is a stateful widget now
                        });
                      },
                      validator: (value){    //validates whether usernames is empty
                        if(value!.isEmpty)
                          {return "Username is Empty";}

                          return null;
                      },
                    ),

                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter password", labelText: "Password"),
                      validator: (value){    //validates whether usernames is empty
                        if(value!.isEmpty)
                        {return "Password is Empty";}

                        else if(value.length<6)         //if password is less than 6 characters
                        {return "Password must be greater than 6 characters";}
                        return null;
                      },
                    ),

                    SizedBox(height: 20),

                    Material(
                      color: Colors.orange,                                           //inkwell wrapped by material to make the splashcolour effect on clicking and the
                                                                                       //decoration code is cpoied form button to here(material)
                      borderRadius: BorderRadius.circular(changebutton?30:6),
                     child: InkWell(
                       splashColor: Colors.pink,   //makes colour red on clicking
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          //time for the animation after clicking the button
                          height: 50,
                          width: changebutton ? 60 : 150,
                          // color: Colors.pinkAccent, since decoration is there colour defined there
                          alignment: Alignment.center,
                          //text alignment to centre
                          child: changebutton
                              ? Icon(Icons.done, color: Colors.black)
                              : Text(
                                  "LOGIN",
                                  //if changebutton true , then put done if not put text.
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                          // decoration: BoxDecoration(
                          //   color: Colors.orange,
                          //   shape:
                          //       changebutton ? BoxShape.circle : BoxShape.rectangle,
                          //   // borderRadius: BorderRadius.circular(changebutton?30:6),   //either change the shape through border radius or through shape , both cant be done simultaneously
                          // ),
                        ),
                        onTap: ()  => movetoNext(context) //same as onpressed of elevated button

                      ),
                    )
                    // ElevatedButton(
                    //   child: Text("LOGIN"),
                    //   style: TextButton.styleFrom(minimumSize: Size(100, 45)),      //setting size of login button
                    //   onPressed: (){
                    //  // Navigator.push(context,
                    //  //     MaterialPageRoute(builder: (context) => Homepage()));  //to navigate to homepage , context is retreived from build
                    //   },
                    // )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
