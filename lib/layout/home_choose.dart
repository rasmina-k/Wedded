import 'package:flutter/material.dart';
import 'package:wedded/layout/user_register.dart';
import 'package:wedded/layout/vendor_register.dart';

class choose extends StatefulWidget {
  const choose({Key? key}) : super(key: key);

  @override
  State<choose> createState() => _chooseState();
}

class _chooseState extends State<choose> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 78, 36, 16),
        title: Text('SIGN UP'),
      ),
      body: 
       Container(
          constraints: BoxConstraints.expand(),
          // padding: EdgeInsets.all(60),
          decoration: const BoxDecoration(
          image: DecorationImage(
          image: AssetImage("assets/sam7.jpg"), 
          fit: BoxFit.cover
          ),
        ),
      // Container(
      //   padding: EdgeInsets.all(60),
      //   decoration: BoxDecoration(
      //     image: DecorationImage(
      //       image: AssetImage('assets/sam2.jfif'),
      //       fit: BoxFit.cover,
      //       )
      //   ),
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(100, 200, 100, 200),
          child: Column(
            children: [
              Container(
                 child: Center(
                child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => user_register()));
            },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 180, 131, 109),
                minimumSize: Size(300, 50),  
              ),
              child: Text('  Are you an User?  ')
          )
        ),
        ),
        SizedBox(
          height: 25, // <-- SEE HERE
        ),
          Container(
             child: Center(
            child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => vendor_register()));
            },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 180, 131, 109),
                minimumSize: Size(300, 50), 
              ),
              child: Text(' Are you a Vendor? ')
          )
             ),
          ),
          ],
        )
      ),
      ),
    );
  }
}