import 'package:flutter/material.dart';
import 'package:password_generator_in_flutter/simple.dart';

import 'hard.dart';

void main() => runApp( MyApp());

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  static const appTitle = 'Password Generator';

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
   MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body:  Center(
        child:
          Text('Main Page'),
      ),
      drawer: Drawer(

        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
              child: Text('Password Genarator',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),),
            ),

            ListTile(
              title: const Text('SIMPLE',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16.0,
                ),
              ),
              onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (c)=>simple()));
              },
            ),
            ListTile(
              title: const Text('HARD',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16.0,
                ),),
              onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (c)=>hard()));
              },
            ),
            ListTile(
              title: const Text('Upload Password',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16.0,
                ),),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Reterive Password',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16.0,
                ),),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),


          ],
        ),
      ),
    );
  }
}