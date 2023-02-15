import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wedded/layout/home_choose.dart';
import 'package:http/http.dart';
import 'package:wedded/layout/navigationbar.dart';
import 'package:wedded/layout/navigationbar2.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

   @override
  State<login> createState() => _loginState();
  static var url="http://192.168.56.1:8000/";
  static var uid="1";
}

class _loginState extends State<login> {
   late TextEditingController username,password;
  var data=[];

  @override
  void initState() {
    username=TextEditingController();
    password=TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  void postdata() async {
    var url= login.url+"login/Login/";
    // String url = "http://192.168.1.47:8000/login/log/";
    Response resp = await post(url, body: {
      "username": username.text,
      "password": password.text,
    });

    data=jsonDecode(resp.body);
    // print(data);
    if (data.length>0)
    {
      login.uid=data[0]['u_id'].toString();
      if(data[0]['type']=="user")
      {
        // Navigator.of(context).pop();
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => testing()));
        showDialog(context: context, builder: (context) => AlertDialog(
            content: Text("you have successfully logged in")));

      }
      else if(data[0]['type']=="vendor")
      {
        // Navigator.of(context).pop();
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => testing2()));
        showDialog(context: context, builder: (context) => AlertDialog(
            content: Text("you have successfully logged in")));

      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 78, 36, 16),
        title: Text('LOGIN'),
      ),
      body: 
       Container(
          constraints: BoxConstraints.expand(),
          // padding: EdgeInsets.all(60),
          decoration: const BoxDecoration(
          image: DecorationImage(
          image: AssetImage("assets/sam8.jfif"), 
          fit: BoxFit.cover
          ),
        ),
        child: SingleChildScrollView(
          // padding: EdgeInsets.fromLTRB(100, 200, 100, 200),
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                ),
              ),
              ),
            Container(
              padding: EdgeInsets.fromLTRB(30, 10, 20, 10),
              child: TextField(
                controller: username,
                decoration: InputDecoration(labelText: 'Username',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                suffixIcon: Icon(Icons.people)
                ),
              ),
            ),
          Container(
            padding:  EdgeInsets.fromLTRB(30, 10, 20, 10),
            child: TextField(
                controller: password,
                decoration: InputDecoration(labelText: 'Password',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                suffixIcon: Icon(Icons.password)
              ), 
            ),
          ),
          Container(
            padding:  EdgeInsets.fromLTRB(30, 10, 20, 10),
            child: ElevatedButton(
            onPressed: () {
              postdata();
            },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 78, 36, 16),
                minimumSize: Size(200, 50),
              ),
              child: Text('GOOOO')
          )
          ),
          Row(
              children: <Widget>[
                const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                    'Sign in',
                    style: TextStyle( color: Color.fromARGB(255, 252, 254, 255)),  
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => choose()));
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ], 
          ),
        ),
      ),  
    );   
  }
}