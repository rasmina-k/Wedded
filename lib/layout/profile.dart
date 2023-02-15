import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:wedded/layout/user_register.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  late List data;
  void view() async {
    Response resp=await get("http://192.168.56.1:8000/user_register/User/");
    setState(() {
      data = jsonDecode(resp.body);
    });
  }
  @override
  void initState() {
    view();
  }
  Widget build(BuildContext context) {
    view();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 78, 36, 16),
        title: Text("PROFILE"),
        actions: [
          IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => user_register()));
          },
          icon: const Icon(Icons.edit),
          ),
        ],
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
                    Text('NAME' +data[index]['username'].toString()),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('FIRST NAME' +data[index]['first_name'].toString()),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('LAST NAME' +data[index]['last_name'].toString()),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('PHONE NO' +data[index]['phone_no'].toString()),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('EMAIL' +data[index]['email'].toString()),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('CITY' +data[index]['city'].toString()),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('DISTRICT' +data[index]['district'].toString()),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('STATE' +data[index]['state'].toString()),
                  ],
                ),
              ],
              ),),
            );
          }),
      ),

      );
  }
}