import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:signup_login_wirh_firebase/HomeScreen.dart';
import 'SignupScreen.dart';


class login extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  Future<FirebaseUser?> Login(String email, String pass) async{
    FirebaseAuth _auth= FirebaseAuth.instance;
    try{
      AuthResult result= await  _auth.signInWithEmailAndPassword(email: email, password: pass);
      FirebaseUser user=result.user;
      return user;
    }
    catch(e){
      print(e);
      return null;
    }
  }


  login({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Login',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20,),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: 'Type Your Email',
                  labelText: 'Email',
                ),
                controller: _emailController,
              ),
              const SizedBox(height: 20,),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.password_outlined),
                  // hintText: 'Enter your complete name',
                  labelText: 'Password',
                ),
                controller: _passController,
              ),
              const SizedBox(height: 15,),
              Container(
                padding: const EdgeInsets.all(20),
                child: FlatButton(onPressed: () async{
                  final email= _emailController.text.toString().trim();
                  final pass= _passController.text.toString().trim();
                  FirebaseUser? user=await Login(email, pass);
                    if(user !=null){
                      Navigator.push(context, MaterialPageRoute(builder: (Context)=> HomeScreen(name: user.displayName)));
                    }
                    else{
                      print('Error');
                    }
                },
                  child: const Text('Register',style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                  ),
                  color: Colors.teal,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account?'),
                  FlatButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (Context)=> signup()));
                  }, child: const Text('Signup',style: TextStyle(
                    color: Colors.teal,
                  ),),)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
