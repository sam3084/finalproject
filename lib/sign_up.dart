import 'package:finalproject/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool _isPasswordVisible = false;

  signup() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email.text.trim(),
      password: password.text.trim(),
    );
    Get.offAll(() =>WrapperState());
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
                  'assets/images/signup.png',
                  width: 500,
                  height: 300,
                  fit: BoxFit.cover,
                ),

                SizedBox(height: 30,),
                TextField(
                  controller: email,
                  decoration: InputDecoration(hintText: 'Enter email',
                      border: OutlineInputBorder()),

                ),
                SizedBox(height: 10,),
                TextField(
                  controller: password,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(hintText: 'Enter password',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible? Icons.visibility:Icons.visibility_off,
                        ),
                        onPressed: (){
                          setState(() {
                            _isPasswordVisible=!_isPasswordVisible;
                          });
                        },
                      )),

                ),
                SizedBox(height: 20,),
                ElevatedButton(

                  onPressed: signup,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Signup'),
                ),

              ],
            ),
          ),
        ),

      ),
    );
  }
}

