import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:wedded/layout/booking.dart';
import 'package:wedded/layout/vendorlist.dart';
import 'package:wedded/layout/view_vendor_1.dart';

class view_vendor extends StatefulWidget {
  const view_vendor({Key? key}) : super(key: key);
  static var ftype="";
  @override
  State<view_vendor> createState() => _view_vendorState();
}

class _view_vendorState extends State<view_vendor> {
  @override
  late List data;
  void view() async {
    var url = Uri.parse("http://192.168.56.1:8000/service/Serviceview/");
    Response resp=await post(url,body: {
      'ftype': view_vendor.ftype
    });
    setState(() {
      data = jsonDecode(resp.body);
    });
  }
  // void view1() async {
  //   Response resp=await get("http://192.168.1.4:8000/vendor_register/Vendor/");
  //   setState(() {
  //     data = jsonDecode(resp.body);
  //   });
  // }
  @override
  void initState() {
    view();
    // view1();
  }
  Widget build(BuildContext context) {
    view();
    // view1();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 78, 36, 16),
        title: Text("WEDDED"),
      ),
      body : Container(
        child: new ListView.builder(
          itemCount: data!=null?data.length:0,
          itemBuilder: (BuildContext context, int index){
            return new Padding(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 30), 
              child: new Card(child: Column(mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget> [
                new SizedBox(
                  height: 20,
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('' +data[index]['business_name'].toString()),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('' +data[index]['category'].toString()),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('starting from: ' +data[index]['cost'].toString()),
                  ],
                ),
                // new Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     Text('' +data[index]['city'].toString()),
                //   ],
                // ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('ABOUT: ' +data[index]['about'].toString()),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('SERVICE: ' +data[index]['services'].toString()),
                  ],
                ),
          //       Container(child: ElevatedButton(
          //   onPressed: () {
          //     Navigator.of(context).push(MaterialPageRoute(
          //       builder: (BuildContext context) => view_vendor1()));
          //   },
          //     style: ElevatedButton.styleFrom(
          //       primary: Color.fromARGB(255, 78, 36, 16),
          //       minimumSize: Size(200, 50),
          //     ),
          //     child: Text('READ MORE')
          // )
          // ),
                Container(child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => booking()));
            },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 78, 36, 16),
                minimumSize: Size(200, 50),
              ),
              child: Text('BOOK NOW!')
          )
          ),
              ],
              ),),
            );
          }),
      ),

    );
  }
}
