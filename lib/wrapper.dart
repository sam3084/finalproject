import 'package:finalproject/ketrin.dart';
//import 'package:ff/ketrin.dart';
import 'package:finalproject/logn_in.dart';
import 'package:finalproject/navigationbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WrapperState extends StatefulWidget {
  const WrapperState({super.key});

  @override
  State<WrapperState> createState() => _WrapperStateState();
}

class _WrapperStateState extends State<WrapperState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return bottombar();    //or ketrin
            } else {
              return lognin();
            }
          }),
    );
  }
}