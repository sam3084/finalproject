import 'package:finalproject/forgot.dart';
import 'package:finalproject/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class lognin extends StatefulWidget {
  const lognin({super.key});

  @override
  State<lognin> createState() => _logninState();
}

class _logninState extends State<lognin> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
bool _isPasswordVisible = false;
  signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login Successful')),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'Login Failed')),
      );
    }
  }

  //forgot password text
  void forgotPassword(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> const Forgot()),);
  }

  void gotosignup(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> const signup()),);
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
                        'assets/images/login.png',
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


                  //forgot password text
                  const SizedBox(height: 10,),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: forgotPassword ,
                      child: const Text("Forgot Password?",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),

                  SizedBox(height: 20,),
                  ElevatedButton(

                    onPressed: signIn,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                    ),
                    child: Text('Login'),
                  ),




                  //////////
                  // registeration link
                  const SizedBox(height: 60,),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: RichText(text: TextSpan(
                      text: "Not a member?",
                      style: const TextStyle(
                        color: Colors.black,

                      ),
                      children: [
                        TextSpan(
                          text: "Register now",
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap=gotosignup,
                        )
                      ],

                    ),


                    ),

                  )

                ],
              ),
            ),
          ),

      ),
    );
  }
}

