import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  static const appTitle = 'Password Diary';

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
   MyHomePage({Key? key, required this.title}) : super(key: key);
   final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   final _formKey = GlobalKey<FormState>();

  TextEditingController code=new TextEditingController();

   TextEditingController description=new TextEditingController();

   TextEditingController password=new TextEditingController();

   final dbRef = FirebaseDatabase.instance.reference().child("User");

   List<String> list=[];

   String scode="";
   bool valid=false;

   String d="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body:  Container(
        color: Colors.white,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Passwords list"),
            SizedBox(
              height: 20,
            ),
           valid ? Expanded(
             child: ListView.builder(shrinkWrap: true,itemCount: list.length,padding: EdgeInsets.only(top: 20),itemBuilder: (_,index){
                return ListTile(title: Text(list[index]),);
              }),
           ):Text("")
      
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Text('Diary Management App',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),),
            ),

            ListTile(
              title: const Text('Add Password',
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 16.0,
                ),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Form(
                    key: _formKey,
                      child: AlertDialog(
                          title: Text('Enter Your Security code'),
                          content: TextField(
                            controller: code,
                            textInputAction: TextInputAction.go,
                            keyboardType: TextInputType.numberWithOptions(),
                            decoration: InputDecoration(hintText: "Security Code"),
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child: new Text('Submit'),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                        title: Text('Description/Password'),
                                        content: Column(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          //position
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TextFormField(
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'description';
                                                }
                                                return null;
                                              },
                                              controller: description,
                                              textInputAction: TextInputAction.go,
                                              // keyboardType: TextInputType.numberWithOptions(),
                                              decoration: InputDecoration(hintText: "Discription"),
                                            ),
                                            TextFormField(
                                              controller: password,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'password';
                                                }
                                                return null;
                                              },
                                              textInputAction: TextInputAction.go,
                                              // keyboardType: TextInputType.numberWithOptions(),
                                              decoration: InputDecoration(hintText: "Password"),

                                            ),
                                          ],
                                        ),
                                        actions: <Widget>[
                                          new FlatButton(
                                              child: new Text('OK'),
                                              onPressed: () {
                                                if (_formKey.currentState!.validate()) {
                                                  scode=code.text;
                                                  dbRef.push().set({
                                                    "Security_code": code.text,
                                                    "password": password.text,
                                                    "description":description.text,

                                                  }).then((_) {
                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                        SnackBar(content: Text('Successfully Added')));
                                                    description.clear();
                                                    password.clear();
                                                    code.clear();
                                                  }).catchError((onError) {
                                                    ScaffoldMessenger.of(context)
                                                        .showSnackBar(SnackBar(content: Text(onError)));
                                                  });
                                                }
                                              }

                                          )
                                        ]
                                    );
                                  },
                                );
                                    }
                            )
                          ]
                      ),
                    );
                  },
                );
              },
            ),
            ListTile(
              title: const Text('Save Password',
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 16.0,
                ),),
              onTap: () {
              },
            ),
            ListTile(
              title: const Text('Retrieve Password',
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 16.0,
                ),),
              onTap: () async {
                final key=GlobalKey<FormState>();
                showDialog(context: context, builder: (_){
                  return AlertDialog(
                    content: Container(
                      height: 200,
                      width: 350,
                      child: Column(
                        children: [
                          Form(
                            key:key,
                            child: Column(
                              children: [
                                TextFormField(

                                  decoration: InputDecoration(
                                    border: OutlineInputBorder()

                                  ),
                                  validator: (str){
                                    if(str!=scode)
                                      {
                                        return "Invalid Code";
                                      }

                                  },
                                ),
                                ElevatedButton(onPressed: (){
                                  var abc =key.currentState;
                                  if(abc!.validate()){
                                    valid=true;
                                    setState(() {

                                    });
                                    // Update the state of the app
                                    // ...
                                    // Then close the drawer
                                    Navigator.pop(context);
                                    //done
                                  }
                                }, child: Text("validate"))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
                final ref=FirebaseDatabase.instance.ref();
                DataSnapshot ds= await ref.child("User").once().then((value) => value.snapshot);
                if(ds.exists && ds.value!=null){
                  Map mp=ds.value as Map;
                  mp.forEach((key, value) {
                    list.add(value['password']);
                  });
                }

              },
            ),

          ],
        ),
      ),
    );
  }

   void dispose(){
    description.dispose();
    password.dispose();
   }
}