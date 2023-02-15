import 'package:flutter/material.dart';
import 'package:wedded/layout/home_choose.dart';
import 'package:wedded/layout/login.dart';
 
class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 78, 36, 16),
        title: Text('WEDDED'),
      ),
      body: 
      // Container(
      //   padding: EdgeInsets.all(60),
      //   decoration: BoxDecoration(
      //     image: DecorationImage(
      //       image: AssetImage('assets/sam2.jfif'),
      //       fit : BoxFit.cover,
      //       )
      //   ),
        Container(
          constraints: BoxConstraints.expand(),
          // padding: EdgeInsets.all(60),
          decoration: const BoxDecoration(
          image: DecorationImage(
          image: AssetImage("assets/sam1.jfif"), 
          fit: BoxFit.cover
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(100, 200, 100, 200),
          child: Column(
            children: [
              Container(
                 child: Center(
                child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => login()));
            },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 180, 131, 109),
                minimumSize: Size(200, 50),
              ),
              child: Text('  LOGIN  ')
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
                builder: (BuildContext context) => choose()));
            },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 180, 131, 109),
                minimumSize: Size(200, 50),
              ),
              child: Text('SIGN UP')
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