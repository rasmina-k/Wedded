import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:wedded/layout/homepage.dart';
import 'package:wedded/layout/navigationbar.dart';

class user_register extends StatefulWidget {
  const user_register({Key? key}) : super(key: key);

  @override
  State<user_register> createState() => _user_registerState();
}

class _user_registerState extends State<user_register> {
  late TextEditingController username,first_name,last_name,phone_no,email_id,wed_date,role,city,district,state,password,re_password;
  @override
  void initState() {
    username = TextEditingController();
    first_name = TextEditingController();
    last_name = TextEditingController();
    phone_no = TextEditingController();
    email_id = TextEditingController();
    wed_date = TextEditingController();
    role = TextEditingController();
    city = TextEditingController();
    district = TextEditingController();
    state = TextEditingController();
    password = TextEditingController();
    re_password = TextEditingController();
    super.initState();
  }
  void postdata()async {
    String url = "http://192.168.56.1:8000/user_register/User/";
    var resp = await post(url,body:{
    "username":username.text.toString(),
    "first_name":first_name.text.toString(),
    "last_name":last_name.text.toString(),
    "phone_no":phone_no.text.toString(),
    "email":email_id.text.toString(),
    "wedding_date":wed_date.text.toString(),
    "role":role.text.toString(),
    "city":city.text.toString(),
    "district":district.text.toString(),
    "state":state.text.toString(),
    "password_1":password.text.toString(),
    "password_2":re_password.text.toString(),
    });
  }
  List dropList =[
  {"devi_id":"Bride", "name": "Bride"},
  {"devi_id":"Groom", "name": "Groom"},
  {"devi_id":"Others", "name": "Others"},
  // {"devi_id":"D", "name": "D"},
];

  List dropList2 =[
  {"devi_id":"Kozhikode", "name": "Kozhikode"},
  {"devi_id":"Thrissur", "name": "Thrissur"},
  {"devi_id":"Palakkad", "name": "Palakkad"},
  {"devi_id":"Malappuram", "name": "Malappuram"},
  {"devi_id":"Kasargode", "name": "Kasargode"},
  {"devi_id":"Kannur", "name": "Kannur"},
  {"devi_id":"Ernakulam", "name": "Ernakulam"},
  {"devi_id":"Kollam", "name": "Kollam"},
  {"devi_id":"Kottayam", "name": "Kottayam"},
  {"devi_id":"Wayanad", "name": "Wayanad"},
  {"devi_id":"Pathanamthitta", "name": "Pathanamthitta"},
  {"devi_id":"Idukki", "name": "Idukki"},
  {"devi_id":"Alappuzha", "name": "Alappuzha"},
  {"devi_id":"Thiruvananthpuram", "name": "Thiruvananthpuram"},
];

List dropList3 =[
  {"devi_id":"Kerala", "name": "Kerala"},
  {"devi_id":"others", "name": "Others"},
];

var dropdownValue = "";
var dropdownValue1 = "";
var dropdownValue2 = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 78, 36, 16),
        title: Text('REGISTER'),
      ),
      body: 
      Container(
          constraints: BoxConstraints.expand(),
          // padding: EdgeInsets.all(60),
          decoration: const BoxDecoration(
          image: DecorationImage(
          image: AssetImage("assets/sam3.jfif"), 
          fit: BoxFit.cover
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                controller: first_name,
                decoration: InputDecoration(labelText: 'First name',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                suffixIcon: Icon(Icons.people)
              ), 
            ),
          ),
          Container(
            padding:  EdgeInsets.fromLTRB(30, 10, 20, 10),
            child: TextField(
                controller: last_name,
                decoration: InputDecoration(labelText: 'Last name',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                suffixIcon: Icon(Icons.people)
              ), 
            ),
          ),
          Container(
            padding:  EdgeInsets.fromLTRB(30, 10, 20, 10),
            child: TextField(
                controller: phone_no,
                decoration: InputDecoration(labelText: 'Phone no',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                suffixIcon: Icon(Icons.phone)
              ), 
            ),
          ),
          Container(
            padding:  EdgeInsets.fromLTRB(30, 10, 20, 10),
            child: TextField(
                controller: email_id,
                decoration: InputDecoration(labelText: 'Email id',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                suffixIcon: Icon(Icons.email)
              ), 
            ),
          ),
          Container(
            padding:  EdgeInsets.fromLTRB(30, 10, 20, 10),
            child: TextField(
                controller: wed_date,
                decoration: InputDecoration(labelText: 'Wedding date',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                suffixIcon: Icon(Icons.date_range)
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
        hint: Text("Role"),
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
                controller: city,
                decoration: InputDecoration(labelText: 'City',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                suffixIcon: Icon(Icons.place)
              ), 
            ),
          ),
          Container( //dropdown
    padding:  EdgeInsets.fromLTRB(30, 10, 20, 10),
    //  width: 150.0,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        // border: Border.all(color: Colors.black)
    ),
    child: DropdownButtonFormField(
      // labelText: 'role'
        hint: Text("District"),
        onChanged: ( newValue) {
          setState(() {
            dropdownValue1 = newValue.toString();
            print(dropdownValue1);
          });
        },
        items: dropList2.map((item) => DropdownMenuItem(child: Text(item['name'].toString()),value:item['devi_id'].toString(),)).toList()
    )

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
        hint: Text("State"),
        onChanged: ( newValue) {
          setState(() {
            dropdownValue2 = newValue.toString();
            print(dropdownValue2);
          });
        },
        items: dropList3.map((item) => DropdownMenuItem(child: Text(item['name'].toString()),value:item['devi_id'].toString(),)).toList()
    )
          ),
          Container(
            padding:  EdgeInsets.fromLTRB(30, 10, 20, 10),
            child: TextField(
                controller: password,
                decoration: InputDecoration(labelText: 'Password',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                suffixIcon: Icon(Icons.location_city)
              ), 
            ),
          ),
          Container(
            padding:  EdgeInsets.fromLTRB(30, 10, 20, 10),
            child: TextField(
                controller: re_password,
                decoration: InputDecoration(labelText: 'Renter Password',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                suffixIcon: Icon(Icons.location_city)
              ), 
            ),
          ),
          Container(
            child: ElevatedButton(
            onPressed: () {
              // postdata();
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => testing()));
                postdata();
            },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 78, 36, 16),
                minimumSize: Size(200, 50),
              ),
              child: Text('REGISTER')
          )
          ), 
          ]
          ),
        ),
      ),
      ) ;  
  }
}