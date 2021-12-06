import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'HomeScreen.dart';
import 'LoginScreen.dart';

class signup extends StatelessWidget {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  signup({Key? key}) : super(key: key);

  Future<bool> registerUser(String name, String email, String pass) async{
  FirebaseAuth _auth= FirebaseAuth.instance;
    try{
    AuthResult result= await  _auth.createUserWithEmailAndPassword(email: email, password: pass);
    FirebaseUser user=result.user;
    UserUpdateInfo info=UserUpdateInfo();
    info.displayName=name;
    user.updateProfile(info);
    return true;
  }
  catch(e){
    print(e);
    return false;
  }
  }

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
                    const Text('Registration',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'Enter your complete name',
                        labelText: 'Full Name',
                      ),
                      controller: _nameController,
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
                      final name = _nameController.text.toString().trim();
                      final email = _emailController.text.toString().trim();
                      final pass = _passController.text.toString().trim();
                      bool result=await registerUser(name, email, pass);
                      if(result){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (Context)=> HomeScreen()));
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
                        const Text('have an account?'),
                        FlatButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (Context)=> login()));
                        }, child: const Text('login',style: TextStyle(
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
