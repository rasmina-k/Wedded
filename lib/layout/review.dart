import 'package:flutter/material.dart';
import 'package:http/http.dart';

class review extends StatefulWidget {
  const review({Key? key}) : super(key: key);

  @override
  State<review> createState() => _reviewState();
}

class _reviewState extends State<review> {
  late TextEditingController rating,review;
  @override
  void initState() {
    rating = TextEditingController();
    review = TextEditingController();
    super.initState();
  }
  void postdata()async {
    String url = "http://192.168.56.1:8000/review/Review/";
    var resp = await post(url,body: {
      "description":review.text.toString(),
      "rating":rating.text.toString(),
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 78, 36, 16),
        title: Text('REVIEW'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
            Container(
              padding: EdgeInsets.fromLTRB(30, 10, 20, 10),
              child: TextField(
                controller: rating,
                decoration: InputDecoration(labelText: 'Rating',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                suffixIcon: Icon(Icons.star)
                ),
              ),
            ),
          Container(
            padding:  EdgeInsets.fromLTRB(30, 10, 20, 10),
            child: TextField(
                controller: review,
                decoration: InputDecoration(labelText: 'Review',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                suffixIcon: Icon(Icons.description)
              ), 
            ),
          ),
          // Container(
          //   padding:  EdgeInsets.fromLTRB(30, 10, 20, 10),
          //   child: TextField(
          //       // controller: username,
          //       decoration: InputDecoration(labelText: 'upload picture',
          //       border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          //       suffixIcon: Icon(Icons.image)
          //     ), 
          //   ),
          // ),
          Container(child: ElevatedButton(
            onPressed: () {
              postdata();
            },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 78, 36, 16),
                minimumSize: Size(200, 50),
              ),
              child: Text('UPLOAD')
          )
          ), 
          ]
          ),
        ),
      ),  
    );

    
  }
}