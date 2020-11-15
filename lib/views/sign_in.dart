import 'package:flutter/material.dart';
import 'package:quiz_maker/helper/funtions.dart';
import 'package:quiz_maker/services/auth.dart';
import 'package:quiz_maker/views/home.dart';
import 'package:quiz_maker/views/sign_up.dart';
import 'package:quiz_maker/widgets/widget.dart';


class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final _formKey = GlobalKey<FormState>();
  String email, password;
  AuthService authService = new AuthService();

  bool _isLoading = false;


  signIn() async{
    if(_formKey.currentState.validate()){
      setState(() {
        _isLoading=true;
      });
      await authService.signInEmailAndPassword(email, password).then((value){
        if(value!=null){
          setState(() {
            _isLoading=false;
          });
          HelperFunctions.saveUserLoggedInDetails(isLoggedin: true);

          Navigator.pushReplacement((context), MaterialPageRoute(builder: (context)=>Home()));
        }
      });


    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.white,
        elevation: 0,
        brightness: Brightness.light,
      ),


      body: _isLoading ? Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ) : Form(
        key: _formKey,
        child: SingleChildScrollView(

          child: Container(
            //height: MediaQuery.of(context).size.height-50,
            alignment: Alignment.bottomCenter,

            padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
            child: Container(

              //color: Colors.blue,
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Column(
                children: [

                  //Spacer(),


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
                    obscureText: true,
                    validator: (val){
                      return val.isEmpty ?  "Enter correct password" : null;
                    },
                    decoration: InputDecoration(
                      hintText: "password",
                    ),
                    onChanged: (val){
                      password = val;
                    },
                  ),


                  SizedBox(height: 20,),


                  GestureDetector(
                    onTap: (){
                      signIn();
                    },
                    child: blueButton(
                        context:  context,
                        input: "Sign In"
                    )
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
        ),
      ),
    );
  }
}
