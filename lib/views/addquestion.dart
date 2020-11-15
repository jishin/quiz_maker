import 'package:flutter/material.dart';
import 'package:quiz_maker/services/database.dart';
import 'package:quiz_maker/widgets/widget.dart';

class AddQuestion extends StatefulWidget {
  final String quizId;
  AddQuestion({this.quizId});
  @override
  _AddQuestionState createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {

  final _formKey = GlobalKey<FormState>();
  String question, option1, option2, option3, option4;
  bool _isLoading=false;
  DatabaseService databaseService = new DatabaseService();

  uploadQuestionData() async{
    if(_formKey.currentState.validate()){
      setState(() {
        _isLoading=true;
      });
      Map<String,String> questionMap={
        "question" : question,
        "option1" : option1,
        "option2" :option2,
        "option3" :option3,
        "option4" :option4
      };

      await databaseService.assQuestionData(questionMap, widget.quizId)
          .then((value) {
            setState(() {
              _isLoading=false;
            });
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: appBar(context),
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      brightness: Brightness.light,

    ),
      body:_isLoading? Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ) : SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Column(
            children: [
              TextFormField(
                validator: (val){
                  return val.isEmpty ?  "Input Question" : null;
                },
                decoration: InputDecoration(
                  hintText: "Question",
                ),
                onChanged: (val){
                  //todo
                  question = val;
                },
              ),
              SizedBox(height: 20,),

              TextFormField(
                validator: (val){
                  return val.isEmpty ?  "Enter Option1 " : null;
                },
                decoration: InputDecoration(
                  hintText: "Option1 (Correct Answer)",
                ),
                onChanged: (val){
                  //todo
                  option1 = val;
                },
              ),
              SizedBox(height: 20,),


              TextFormField(
                validator: (val){
                  return val.isEmpty ?  "Enter option2" : null;
                },
                decoration: InputDecoration(
                  hintText: "option2",
                ),
                onChanged: (val){
                  //todo
                  option2 = val;
                },
              ),
              SizedBox(height: 20,),

              TextFormField(
                validator: (val){
                  return val.isEmpty ?  "Enter option3" : null;
                },
                decoration: InputDecoration(
                  hintText: "option3",
                ),
                onChanged: (val){
                  //todo
                  option3 = val;
                },
              ),
              SizedBox(height: 20,),

              TextFormField(
                validator: (val){
                  return val.isEmpty ?  "Enter option4" : null;
                },
                decoration: InputDecoration(
                  hintText: "option4",
                ),
                onChanged: (val){
                  //todo
                  option4 = val;
                },
              ),
              SizedBox(height: 180,),

              Wrap(
                  direction: Axis.horizontal,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: blueButton(
                        context:  context,
                        input: "Submit",
                      buttonWidth: MediaQuery.of(context).size.width/2 - 48
                    ),
                  ),
                  SizedBox(width: 24,),
                  GestureDetector(
                    onTap: (){
                      //todo
                      uploadQuestionData();
                    },
                    child: blueButton(
                        context:  context,
                        input: "Add Question",
                        buttonWidth: MediaQuery.of(context).size.width/2 - 48
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),


    );
  }
}
