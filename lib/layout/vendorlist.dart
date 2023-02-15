import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wedded/layout/booking.dart';
import 'package:wedded/layout/eventlist.dart';
import 'package:wedded/layout/review.dart';
import 'package:wedded/layout/view_vendor.dart';
// import 'package:http/http.dart';
// import 'package:medicine_box2/layout/login.dart';
class vendorlist extends StatefulWidget {
  const vendorlist({Key? key}) : super(key: key);

  @override
  State<vendorlist> createState() => _vendorlistState();
}

class _vendorlistState extends State<vendorlist> {
  // late List data;
  // void List_function() async {
  //   var url = Uri.parse(login.url+"medical_awareness/flutawar/");
  //   Response resp1 = await get(url);
  //   data = jsonDecode(resp1.body);
  //   this.setState(() {
  //   });
  //   print(resp1.body);
  // }
void _onItemTapped(int index) {
    setState(() {
      // _selectedIndex = index;
      print(index.toString());
  

    });
  }
  var arr=['Makeup Artist','Mehndi Artist','Wedding Photography','Event Management'];
  @override
  Widget build(BuildContext context) {
    // List_function();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 78, 36, 16),
        title: Text(
          "VENDORS",
          // style: new TextStyle(
          //   fontSize: 30,
          //   fontWeight: FontWeight.bold,
          // ),
        ),
      ),
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/sam1.jfif'),
                fit: BoxFit.cover,
              )
          ),
          child: new ListView.builder(
            // itemCount: data == null ? 0 : data.length,
            itemCount: 4,
            itemBuilder: (context, index) {
              return new Padding(
                padding: new EdgeInsets.fromLTRB(20, 05, 10, 5),
                child: new Card(
                  elevation: 2.0,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(16.0)
                  ),
                  child: InkWell(
                    onTap: () {
                      if(index==0)
                      {
                        view_vendor.ftype="Bridal_Makeup";
                        Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => const view_vendor()));
                      }
                      else if(index==1)
                      {
                        // Navigator.of(context).push(MaterialPageRoute(
                        // builder: (BuildContext context) => const booking()));
                        view_vendor.ftype="Bridal_Mehndi";
                        Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => const view_vendor()));
                      }
                      else if(index==2)
                      {
                        view_vendor.ftype="Photography";
                        Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => const view_vendor()));
                      }
                      else if(index==3)
                      {
                        view_vendor.ftype="Event_Management";
                        Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => const eventlist()));
                      }
                      // print("tapped");
                      //  tap funtion here
                    },
                    child: new Column(
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.all(16.0),
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              // Image.network(mainpage.url+"static/"+data[index]['pmr'].toString()),
                              new Text(arr[index],
                                style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          )
      ),
    );
  }
}