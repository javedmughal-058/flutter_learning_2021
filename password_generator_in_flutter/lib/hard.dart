import 'package:flutter/material.dart';
import 'package:password_generator_in_flutter/main.dart';


class hard extends StatelessWidget {
  const hard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Hard';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title:  Text(appTitle),
          actions: [IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (c)=>MyApp()));

          }, icon: Icon(Icons.arrow_back))],
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatelessWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'How many symbols you want?',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'How many character you want?',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'How manY UPPERCASE you want?',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'How many lowercase you want?',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'How many numbers you want?',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'How much length of the password',
            ),
          ),
        ),
        Padding( padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: ElevatedButton(onPressed: (){}, child: Text("Genarate")))
      ],
      );
  }
}