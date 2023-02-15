import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:wedded/layout/vendor_detail.dart';

class service extends StatefulWidget {
  const service({Key? key}) : super(key: key);

  @override
  State<service> createState() => _serviceState();
}

class _serviceState extends State<service> {
  late TextEditingController business_name,category,about,service,any_link,cost;
  @override
  void initState() {
    business_name = TextEditingController();
    category = TextEditingController();
    about = TextEditingController();
    service = TextEditingController();
    any_link = TextEditingController();
    cost = TextEditingController();
    super.initState();
  }
  void postdata()async {
    String url = "http://192.168.56.1:8000/service/Service/";
    var resp = await post(url,body:{
      "business_name" : business_name.text.toString(),
      "category" : dropdownValue.toString(),
      "about" : about.text.toString(),
      "services" :service.text.toString(),
      "any_link" : any_link.text.toString(),
      "cost" : cost.text.toString(),
    });
  }
   List dropList =[
  {"devi_id":"Bridal_Makeup", "name": "Bridal_Makeup"},
  {"devi_id":"Bridal_Mehndi", "name": "Bridal_Mehndi"},
  {"devi_id":"Photography", "name": "Photography"},
  {"devi_id":"Event_Management", "name": "Event_Management"},
];
var dropdownValue = "";
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 78, 36, 16),
        title: Text('ADD SERVICES'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
            Container(
              padding: EdgeInsets.fromLTRB(30, 10, 20, 10),
              child: TextField(
                controller: business_name,
                decoration: InputDecoration(labelText: 'Business name',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                suffixIcon: Icon(Icons.people)
                ),
              ),
            ),
           Container( //dropdown
    padding:  EdgeInsets.fromLTRB(30, 10, 20, 10),
    //  width: 150.0,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        // border: Border.all(color: Colors.black)
    ),
    child: DropdownButtonFormField(
      // labelText: 'role'
        hint: Text("Category"),
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
            padding:  EdgeInsets.fromLTRB(30, 10, 20, 10),
            child: TextField(
                controller: about,
                decoration: InputDecoration(labelText: 'About',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                contentPadding: EdgeInsets.symmetric(vertical: 60),
                suffixIcon: Icon(Icons.description)
              ), 
            ),
          ),
          Container(
            padding:  EdgeInsets.fromLTRB(30, 10, 20, 10),
            child: TextField(
                controller: service,
                decoration: InputDecoration(labelText: 'Services',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                suffixIcon: Icon(Icons.design_services)
              ), 
            ),
          ),
          Container(
            padding:  EdgeInsets.fromLTRB(30, 10, 20, 10),
            child: TextField(
                controller: any_link,
                decoration: InputDecoration(labelText: 'any links',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                suffixIcon: Icon(Icons.link)
              ), 
            ),
          ),
          Container(
            padding:  EdgeInsets.fromLTRB(30, 10, 20, 10),
            child: TextField(
                controller: cost,
                decoration: InputDecoration(labelText: 'cost',
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