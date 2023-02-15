import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wedded/layout/eventlist.dart';
import 'package:wedded/layout/package.dart';
import 'package:wedded/layout/previous_work.dart';
import 'package:wedded/layout/review.dart';
import 'package:wedded/layout/service.dart';
// import 'package:http/http.dart';
// import 'package:medicine_box2/layout/login.dart';
class vendordetail extends StatefulWidget {
  const vendordetail({Key? key}) : super(key: key);

  @override
  State<vendordetail> createState() => _vendordetailState();
}

class _vendordetailState extends State<vendordetail> {
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
  var arr=['Add Services','Add packages','Add previous works'];
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
            itemCount: 3,
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
                        Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => const service()));
                      }
                      else if(index==1)
                      {
                        Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => const package()));
                      }
                      else if(index==2)
                      {
                        Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => const previous_work()));
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