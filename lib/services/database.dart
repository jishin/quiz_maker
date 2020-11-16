import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  Future<void> addQuizData(Map quizData, String quizId) async{
    await FirebaseFirestore.instance.collection("Quiz").doc(quizId).set(quizData)
        .catchError((e){
          print(e.toString());
    });
  }

  Future<void> assQuestionData(Map questionData, String quizId) async{
    await FirebaseFirestore.instance.collection("Quiz").
    doc(quizId).collection("QNA")
        .add(questionData)
        .catchError((e){
          print(e.toString());
    });
  }

  getQUizData() async{
    return FirebaseFirestore.instance.collection("Quiz")
        .snapshots();
  }
}

