import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:wedded/layout/vendor_detail.dart';
import 'package:file_picker/file_picker.dart';

class previous_work extends StatefulWidget {
  const previous_work({Key? key}) : super(key: key);

  @override
  State<previous_work> createState() => _previous_workState();
}

class _previous_workState extends State<previous_work> {
  late TextEditingController file,file_type;
  var objfile,fil;
  @override
  void initState() {
    file = TextEditingController();
    file_type = TextEditingController();
    super.initState();
  }
  void postdata()async {
    String url = "http://192.168.56.1:8000/previous_work/Previous_work/";
    var resp = await post(url,body: {
      "file" : file.text.toString(),
      "file_type" : file_type.text.toString(),
    });
  }
  file_up() async {
  print('added successfully');
  var result = await FilePicker.platform.pickFiles(withReadStream: true);
  if (result != null) {
    // var fil=result.files.single.path;
    setState(() {
      fil= result.files.first.name;
      objfile = result.files.single;
      file.text=fil;
    });
  } else {
    // User canceled the picker
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 78, 36, 16),
        title: Text('Previous work'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
            // Container(
            //   padding: EdgeInsets.fromLTRB(30, 20, 10, 20),
            //   child: TextField(
            //     controller: file,
            //     decoration: InputDecoration(labelText: 'File',
            //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
            //     suffixIcon: Icon(Icons.file_copy)
            //     ),
            //   ),
            // ),
            Container(
  padding: EdgeInsets.symmetric(vertical: 1.0),
  width: double.infinity,
  child: RaisedButton(
    elevation: 5.0,
    onPressed: () {
      file_up();
    },
    padding: EdgeInsets.all(15.15),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(bottomRight:Radius.circular(10) , topRight: Radius.circular(10),topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
      //borderRadius: BorderRadius.only()
    ),
    color: Colors.white,
    child: Text(
      'pick photo to upload on your profile ',
      style: TextStyle(
        color: Color(0xFF072850),
        letterSpacing: 1.5,
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'OpenSans',
      ),
    ),
  ),
),
          Container(
            padding:  EdgeInsets.fromLTRB(30, 20, 10, 20),
            child: TextField(
                controller: file_type,
                decoration: InputDecoration(labelText: 'File type',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                suffixIcon: Icon(Icons.picture_as_pdf_outlined)
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