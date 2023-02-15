import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:wedded/layout/vendor_detail.dart';

class package extends StatefulWidget {
  const package({Key? key}) : super(key: key);

  @override
  State<package> createState() => _packageState();
}

class _packageState extends State<package> {
  late TextEditingController package_name,description,cost;
  @override
  void initState() {
    package_name = TextEditingController();
    description = TextEditingController();
    cost = TextEditingController();
    super.initState();
  }
  void postdata()async {
    String url = "http://192.168.56.1:8000/package/Package/";
    var resp = await post(url, body: {
      "package_name" : package_name.text.toString(),
      "description" : description.text.toString(),
      "cost" : cost.text.toString(),
    });
  }
    List dropList =[
  {"devi_id":"Basic", "name": "Basic"},
  {"devi_id":"Standard", "name": "Standard"},
  {"devi_id":"Premium", "name": "Premium"},
];
var dropdownValue = "";
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 78, 36, 16),
        title: Text('ADD PACKAGE'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
          Container( //dropdown
    padding:  EdgeInsets.fromLTRB(30, 10, 20, 10),
    //  width: 150.0,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        // border: Border.all(color: Colors.black)
    ),
    child: DropdownButtonFormField(
      // labelText: 'role'
        hint: Text("Package Name"),
        onChanged: ( newValue) {
          setState(() {
            dropdownValue = newValue.toString();
            print(dropdownValue);
          });
        },
        items: dropList.map((item) => DropdownMenuItem(child: Text(item['name'].toString()),value:item['devi_id'].toString(),)).toList()
    )
          ),
          Container(
            padding:  EdgeInsets.fromLTRB(30, 20, 10, 20),
            child: TextField(
                controller: description,
                decoration: InputDecoration(labelText: 'Package Description',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                contentPadding: EdgeInsets.symmetric(vertical: 60),
                suffixIcon: Icon(Icons.description)
              ), 
            ),
          ),
          Container(
            padding:  EdgeInsets.fromLTRB(30, 20, 10, 20),
            child: TextField(
                controller: cost,
                decoration: InputDecoration(labelText: 'Cost',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                suffixIcon: Icon(Icons.money)
              ), 
            ),
          ),
          Container(child: ElevatedButton(
            onPressed: () {
              postdata();
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => vendordetail()));
            },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 78, 36, 16),
                minimumSize: Size(200, 50),
              ),
              child: Text('ADD')
          )
          ), 
          ]
          ),
        ),
      ),  
    );  
  }
}