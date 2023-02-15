import 'package:flutter/material.dart';
import 'package:wedded/layout/booking.dart';
import 'package:wedded/layout/eventlist.dart';
import 'package:wedded/layout/homepage.dart';
import 'package:wedded/layout/login.dart';
import 'package:wedded/layout/package.dart';
import 'package:wedded/layout/previous_work.dart';
import 'package:wedded/layout/review.dart';
import 'package:wedded/layout/service.dart';
import 'package:wedded/layout/navigationbar.dart';
import 'package:wedded/layout/user_register.dart';
import 'package:wedded/layout/navigationbar2.dart';
import 'package:wedded/layout/vendor_detail.dart';
import 'package:wedded/layout/vendor_register.dart';
import 'package:wedded/layout/vendorlist.dart';


void main() {
  runApp(MaterialApp(
    
    // initialRoute: 'login',
    debugShowCheckedModeBanner: false,
    routes: {
      '/':(context) => login(),
      '/':(context) => vendor_register(),
      '/':(context) => review(),
      '/':(context) => previous_work(),
      '/':(context) => service(),
      '/':(context) => package(),
      '/':(context) => user_register(),
      '/':(context) => booking(),
      '/':(context) => vendordetail(),
      
      '/':(context) => eventlist(),
      '/':(context) => vendorlist(),
      '/':(context) => testing2(),
      '/':(context) => testing(),
      '/':(context) => homepage(),
    },
  ));
}