import 'package:flutter/material.dart';
import 'package:wedded/layout/profile.dart';
import 'package:wedded/layout/vendorlist.dart';
// import 'package:blind/layout/login.dart';

import 'login.dart';
// import 'package:fraudtrans/layouts/viewplot.dart';

//drawer: draw()
//import 'package:controlsapp/custcontrols/draw.dart';

class draw extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 40.0,
                      backgroundImage: AssetImage('assets/sam3.jfif'),
                      // backgroundImage: ,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 20, 20, 30),
                      child: Text(
                        'Welcome ',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )

                ],
                alignment: AlignmentDirectional.center,
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 78, 36, 16),
              ),
            ),
            ListTile(
              leading: Icon(Icons.store),
              title: Text('Vendors'),
              onTap: (){
                // Navigator.pop(context);
                // Navigator.pushNamed(context, '');
                Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => vendorlist()));
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: (){
                // Navigator.pop(context);
                // Navigator.pushNamed(context, '');
                Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => profile()));
              },
            ),
            ListTile(
              leading: Icon(Icons.bookmark_add),
              title: Text('Shorlists'),
              onTap: (){
                // Navigator.pop(context);
                Navigator.pushNamed(context, '');
              },
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Give us feedback'),
              onTap: (){
                // Navigator.pop(context);
                Navigator.pushNamed(context, '');
              },
            ),

            ListTile(
              leading: Icon(Icons.share),
              title: Text('Share'),
              onTap: (){
                // Navigator.pop(context);
                Navigator.pushNamed(context, '');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: (){
                // Navigator.pop(context);
                Navigator.pushNamed(context, '');
              },
            ),
            ListTile(
              leading: Icon(Icons.login_outlined),
              title: Text('Logout'),
              onTap: (){
                // Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => login()));
              },
            ),
            ListTile(
              leading: Icon(Icons.close),
              title: Text('Close'),
              onTap: (){
                // Navigator.of(context).pop();
                Navigator.pop(context);
                Navigator.pushNamed(context, '');
              },
            ),
          ],
        ),
      ),
    );
  }
}

