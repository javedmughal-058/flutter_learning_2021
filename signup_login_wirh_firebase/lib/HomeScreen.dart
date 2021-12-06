import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final name;
  HomeScreen({this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Text('Welcome',style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),),
              Text('$name',style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.black54,
              ),),
            ],
          ),
          SizedBox(height: 10),
          Text('You are successfuly Login...',style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),),
        ],
      ),
    );
  }
}
