import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:wedded/layout/booking.dart';

class view_vendor1 extends StatefulWidget {
  const view_vendor1({Key? key}) : super(key: key);

  @override
  State<view_vendor1> createState() => _view_vendor1State();
}

class _view_vendor1State extends State<view_vendor1> {
  @override
  late List data;
  // void view() async {
  //   Response resp=await get("http://192.168.1.4:8000/previous_work/Previous_work/");
  //   setState(() {
  //     data = jsonDecode(resp.body);
  //   });
  // }
  void view1() async {
    Response resp=await get("http://192.168.56.1:8000/service/Service/");
    setState(() {
      data = jsonDecode(resp.body);
    });
  }
  // void view2() async {
  //   Response resp=await get("http://192.168.1.4:8000/vendor_register/Vendor/");
  //   setState(() {
  //     data = jsonDecode(resp.body);
  //   });
  // }
  @override
  void initState() {
    // view();
    view1();
    // view2();
  }
  Widget build(BuildContext context) {
    // view();
    view1();
    // view2();
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
                    Text('' +data[index]['file'].toString()),
                  ],
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
                    Text('SERVICES: ' +data[index]['services'].toString()),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('STARTING FROM: ' +data[index]['cost'].toString()),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('' +data[index]['city'].toString()),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('' +data[index]['district'].toString()),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('' +data[index]['state'].toString()),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('LINK: ' +data[index]['any_link'].toString()),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('ABOUT: ' +data[index]['about'].toString()),
                  ],
                ),
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