import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageurl =  "https://fastly.picsum.photos/id/866/200/300.jpg?hmac=rcadCENKh4rD6MAp6V_ma-AyWv641M4iiOpe1RyFHeI";   //url of my image
      //url of my image
    return Drawer(
      child: Container(
        color: Colors.deepOrange,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(   //drawer header
              padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountName: Text("Vergab Ghosh"),
                  accountEmail: Text("vergabghosh@gmail.com"),
                currentAccountPicture: CircleAvatar(      //to make the picture circle
                  backgroundImage: NetworkImage(imageurl),
                ),


                )),

            ListTile(   //for home icon and text
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.black,
              ),
              title: Text("Home",
              style: TextStyle(
                fontSize: 15,
                fontStyle: FontStyle.italic,
              ),),
            ),

            ListTile(   //for profile
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.black,
              ),
              title: Text("Visit my profile",
                style: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                ),),
            ),

            ListTile(   //for mail
              leading: Icon(
                CupertinoIcons.mail_solid,
                color: Colors.black,
              ),
              title: Text("Reach me at my mail",
                style: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                ),),
            ),
          ],
        ),
      ),
    );
  }
}
