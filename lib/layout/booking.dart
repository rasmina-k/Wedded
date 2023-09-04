import 'package:flutter/material.dart';
import 'package:http/http.dart';


class booking extends StatefulWidget {
  const booking({Key? key}) : super(key: key);

  @override
  State<booking> createState() => _bookingState();
}

class _bookingState extends State<booking> {
  late TextEditingController name, phone_no, email, fn_date, details;
  @override
  void initState() {
    name = TextEditingController();
    phone_no = TextEditingController();
    email = TextEditingController();
    fn_date = TextEditingController();
    details = TextEditingController();
    super.initState();
  }
  void postdata()async {
    String url = "http://192.168.56.1:8000/booking/Booking/";
    var resp = await post(url,body : {
      "name" : name.text.toString(),
      "phone_no" : phone_no.text.toString(),
      "email" : email.text.toString(),
      "function_date" :fn_date.text.toString(),
      "details" : details.text.toString(),
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 78, 36, 16),
        title: Text('BOOKING'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
            Container(
              padding: EdgeInsets.fromLTRB(30, 10, 20, 10),
              child: TextField(
                controller: name,
                decoration: InputDecoration(labelText: 'Name',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                suffixIcon: Icon(Icons.people)
                ),
              ),
            ),
          Container(
            padding:  EdgeInsets.fromLTRB(30, 10, 20, 10),
            child: TextField(
                controller: phone_no,
                decoration: InputDecoration(labelText: 'Phone NO',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                suffixIcon: Icon(Icons.phone)
              ), 
            ),
          ),
          Container(
            padding:  EdgeInsets.fromLTRB(30, 10, 20, 10),
            child: TextField(
                controller: email,
                decoration: InputDecoration(labelText: 'Email',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                suffixIcon: Icon(Icons.email)
              ), 
            ),
          ),
          Container(
            padding:  EdgeInsets.fromLTRB(30, 10, 20, 10),
            child: TextField(
                controller: fn_date,
                decoration: InputDecoration(labelText: 'Function Date',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                suffixIcon: Icon(Icons.date_range)
              ), 
            ),
          ),
          Container(
            padding:  EdgeInsets.fromLTRB(30, 10, 20, 10),
            child: TextField(
                controller: details,
                decoration: InputDecoration(labelText: 'Details Of Wedding',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                contentPadding: EdgeInsets.symmetric(vertical: 60),
                suffixIcon: Icon(Icons.description)
              ), 
            ),
          ),
          Container(child: ElevatedButton(
            onPressed: () {
              postdata();

            },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 78, 36, 16),
                minimumSize: Size(200, 50),
              ),
              child: Text('SEND MESSAGE')
          )
          ), 
          ]
          ),
        ),
      ),  
    );

    
  }
}
