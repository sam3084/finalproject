import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  TextEditingController email = TextEditingController();



  reset() async {
    await FirebaseAuth.instance.sendPasswordResetEmail(
      email: email.text.trim(),

    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child:

        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/forgot.png',
                  width: 400,
                  height: 300,
                  fit: BoxFit.cover,
                ),

                SizedBox(height: 70,),
                TextField(
                  controller: email,
                  decoration: InputDecoration(hintText: 'Enter email',
                      border: OutlineInputBorder()),

                ),


                SizedBox(height: 60,),
                ElevatedButton(

                  onPressed: reset,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Send Link'),
                ),

              ],
            ),
          ),
        ),

      ),
    );;
  }
}
