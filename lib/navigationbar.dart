import 'package:finalproject/ketrin.dart';
import 'package:finalproject/profile.dart';
import 'package:finalproject/search.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class bottombar extends StatefulWidget {
  const bottombar({super.key});

  @override
  State<bottombar> createState() => _bottombarState();
}

class _bottombarState extends State<bottombar> {
  List Screens=[
    ketrin(),
    search(),
    profile(),
  ];
  int _selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    final items=<Widget>[
      Icon(Icons.home, size: 30),
      Icon(Icons.search, size: 30),
      Icon(Icons.person, size: 30),
    ];
    return  Scaffold(
      body: Screens[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        index: _selectedIndex,
        color: Colors.orange,
        height: 60,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),

        items: items,
        onTap: (index){
          setState(() {
            _selectedIndex=index;
          });
        },
      ),

    );
  }
}
