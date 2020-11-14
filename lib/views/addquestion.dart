import 'package:flutter/material.dart';
import 'package:quiz_maker/widgets/widget.dart';

class AddQuestion extends StatefulWidget {
  @override
  _AddQuestionState createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: appBar(context),
      backgroundColor: Colors.transparent,
      elevation: 0,
      //iconTheme: IconThemeData(color: Colors.black),
      brightness: Brightness.light,

    ),);
  }
}
