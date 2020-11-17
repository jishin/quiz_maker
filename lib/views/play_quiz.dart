import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quiz_maker/models/questio_model.dart';
import 'package:quiz_maker/services/database.dart';
import 'package:quiz_maker/widgets/quiz_play_widget.dart';
import 'package:quiz_maker/widgets/widget.dart';


class PlayQuiz extends StatefulWidget {
  final String quizId;
  PlayQuiz({this.quizId});

  @override
  _PlayQuizState createState() => _PlayQuizState();
}

int _total = 0;
int _correct=0;
int _incorrect =0;
int _notAttempted=0;

class _PlayQuizState extends State<PlayQuiz> {

  DatabaseService databaseService = new DatabaseService();
  QuerySnapshot questionSnapshot;

  @override
  void initState() {
    // TODO: implement initState
    print("${widget.quizId}");
    databaseService.getQuizData(widget.quizId).then((value){
      questionSnapshot=value;
      _notAttempted =0;
      _correct=0;
      _incorrect=0;
      _total = questionSnapshot.docs.length;

      print("$_total this is total ");
      setState(() {

      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),

      ),
      body: Container(
          child: Column(
            children: [
              questionSnapshot.docs ==null?
                  Container():
                  ListView.builder(
                      itemCount: questionSnapshot.docs.length,
                      itemBuilder: (context, index){
                        return QuizPlayTile(
                          
                        );
                      })
            ],
          ),
      ),

    );
  }
}

class QuizPlayTile extends StatefulWidget {
  final QuestionModel questionModel;
  QuizPlayTile({this.questionModel});

  @override
  _QuizPlayTileState createState() => _QuizPlayTileState();
}

class _QuizPlayTileState extends State<QuizPlayTile> {

  String optionSelected = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(widget.questionModel.question),
          SizedBox(height: 4,),
          OptionTile(
            correctAnswer: widget.questionModel.option1,
            description: widget.questionModel.option1,
            option: "A",
            optionSelected: optionSelected,
          ),
          SizedBox(height: 4,),
          OptionTile(
            correctAnswer: widget.questionModel.option1,
            description: widget.questionModel.option2,
            option: "B",
            optionSelected: optionSelected,
          ),
          SizedBox(height: 4,),
          OptionTile(
            correctAnswer: widget.questionModel.option1,
            description: widget.questionModel.option3,
            option: "C",
            optionSelected: optionSelected,
          ),
          SizedBox(height: 4,),
          OptionTile(
            correctAnswer: widget.questionModel.option1,
            description: widget.questionModel.option4,
            option: "D",
            optionSelected: optionSelected,
          ),
        ],
      ),
    );
  }
}

