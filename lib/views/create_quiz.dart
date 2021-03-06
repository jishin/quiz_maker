import 'package:flutter/material.dart';
import 'package:quiz_maker/services/database.dart';
import 'package:quiz_maker/views/addquestion.dart';
import 'package:quiz_maker/widgets/widget.dart';
import 'package:random_string/random_string.dart';

class CreateQuiz extends StatefulWidget {

  @override
  _CreateQuizState createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  final _formKey = GlobalKey<FormState>();
  String quizImageUrl, quizTitle, quizDescription, quizId;
  DatabaseService databaseService = new DatabaseService();
  
  bool _isLoading = false;

  createQuizOnline() async {
    if(_formKey.currentState.validate()){
      setState(() {
        _isLoading=true;
      });
      
      quizId = randomAlphaNumeric(16);
      Map<String,String> quizMap = {
        "quizId" : quizId,
        "quizImageUrl" : quizImageUrl,
        "quizTitle" : quizTitle,
        "quizDesc" : quizDescription,
      };
      await databaseService.addQuizData(quizMap, quizId).then((value){
        setState(() {
          _isLoading = false;
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> AddQuestion(
            quizId: quizId
          )));

        });
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        brightness: Brightness.light,

      ),
      body: _isLoading? Container(
        child: Center(child: CircularProgressIndicator(),),
      ) : Form(
          key: _formKey,
          child: SingleChildScrollView(

            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Column(
                children: [
                  TextFormField(
                    validator: (val){
                      return val.isEmpty ?  "Enter Image URL" : null;
                    },
                    decoration: InputDecoration(
                      hintText: "Quiz Image Url",
                    ),
                    onChanged: (val){
                      quizImageUrl = val;
                    },
                  ),
                  SizedBox(height: 20,),

                  TextFormField(
                    validator: (val){
                      return val.isEmpty ?  "Enter Quiz Title" : null;
                    },
                    decoration: InputDecoration(
                      hintText: "Quiz Title",
                    ),
                    onChanged: (val){
                      quizTitle = val;
                    },
                  ),
                  SizedBox(height: 20,),

                  TextFormField(
                    validator: (val){
                      return val.isEmpty ?  "Enter Description" : null;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter Description",
                    ),
                    onChanged: (val){
                      quizDescription = val;
                    },
                  ),


                  SizedBox(height: 150,),

                  GestureDetector(
                    onTap: (){
                      createQuizOnline();
                    },
                      child: blueButton(
                          context:  context,
                          input: "Create Quiz"
                      )),

                  SizedBox(height: 20,)

                ],
              ),
            ),
          )
      ),
    );
  }
}
