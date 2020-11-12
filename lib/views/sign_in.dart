import 'package:flutter/material.dart';
import 'package:quiz_maker/views/sign_up.dart';
import 'package:quiz_maker/widgets/widget.dart';


class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final _formKey = GlobalKey<FormState>();
  String email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.white,
        elevation: 0,
        brightness: Brightness.light,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          //color: Colors.blue,
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Column(
            children: [
              Spacer(),
              TextFormField(
                validator: (val){
                 return val.isEmpty ?  "Enter correct email" : null;
                },
                decoration: InputDecoration(
                  hintText: "Email",
                ),
                onChanged: (val){
                  email = val;
                },
              ),
              SizedBox(height: 20,),
              TextFormField(
                validator: (val){
                  return val.isEmpty ?  "Enter correct password" : null;
                },
                decoration: InputDecoration(
                  hintText: "password",
                ),
                onChanged: (val){
                  email = val;
                },
              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30)
                ),
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width - 48,
                child: Text("sign In",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? ", style: TextStyle(
                    fontSize: 15,
                  ),),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Text("Sign Up", style: TextStyle(
                      fontSize: 15,
                      decoration: TextDecoration.underline,
                    ),),
                  ),
                ],
              ),
              SizedBox(height: 150,),
            ],
          ),
        ),
      ),
    );
  }
}
