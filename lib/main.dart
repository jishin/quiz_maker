import 'package:flutter/material.dart';
import 'package:quiz_maker/helper/funtions.dart';
import 'package:quiz_maker/views/home.dart';
import 'package:quiz_maker/views/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoggedin = false;
  @override
  void initState() {
    checkUserLoggedInStatus();
    super.initState();
  }
  checkUserLoggedInStatus()async{
    HelperFunctions.getUserLoggedInDetails().then((value) {
      setState(() {
        _isLoggedin = value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: (_isLoggedin ?? false )? Home() :  SignIn(),
    );
  }
}


