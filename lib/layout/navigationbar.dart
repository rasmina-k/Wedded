import 'package:flutter/material.dart';
import 'package:wedded/layout/homepage.dart';
import 'package:wedded/layout/menu_draw.dart';
import 'package:wedded/layout/profile.dart';
import 'package:wedded/layout/vendorlist.dart';


class testing extends StatefulWidget {
  const testing({Key? key}) : super(key: key);
  @override
  State<testing> createState() => _testingState();
}
class _testingState extends State<testing> {
int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(index.toString());

      if(index==0)
        {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => vendorlist()));
        }
      else if(index==1)
        {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) =>profile()));
        }
        // else if(index==2)
        // {
        //   Navigator.of(context).push(MaterialPageRoute(
        //       builder: (BuildContext context) => profile()));
        // }
        // else if(index==3)
        // {
        //   Navigator.of(context).push(MaterialPageRoute(
        //       builder: (BuildContext context) => vendorlist()));
        // }
    });
  }
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 78, 36, 16),
        title: Text('WEDDED'),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => draw()));
          },
          icon: Icon(Icons.menu),
        ),
        actions: [
          IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
            },
            icon: const Icon(Icons.bookmark),
          ),
        ],
        // centerTitle: true,
      ),
      // body: Center(
      //   child: _pages.elementAt(_selectedIndex),
      //   ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(93, 181, 186, 196),
        // elevation: 0,
        items: const <BottomNavigationBarItem>[
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.home),
          //   label: 'Home',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Vendors',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),

          BottomNavigationBarItem(

            icon: Icon(Icons.dashboard),
            label: 'Dashboard',

          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}