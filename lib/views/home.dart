import 'package:flutter/material.dart';
import 'package:quiz_maker/services/database.dart';
import 'package:quiz_maker/views/create_quiz.dart';
import 'package:quiz_maker/widgets/widget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Stream quizStream;
  DatabaseService databaseService = new DatabaseService();

  Widget quizList(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: StreamBuilder(
        stream: quizStream,
        builder: (context, snapshot){
          return snapshot.hasData?
          ListView.builder(
            itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index){
                return QuizTile(
                    imgUrl: snapshot.data.documents[index].data()["quizImageUrl"],
                    title: snapshot.data.documents[index].data()["quizTitle"],
                    desc: snapshot.data.documents[index].data()["quizDesc"]
                );
              }) : Container();
        },
      ),
    );
  }
  @override
  void initState() {
    databaseService.getQUizData().then((value){
      setState(() {
        quizStream = value;
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

      ),
      body: quizList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateQuiz() ));
        },
      ),
    );
  }
}

class QuizTile extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String desc;
  QuizTile({@required this.imgUrl, @required this.title,
  @required this.desc});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.only(bottom: 8),
      //width: ,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(imgUrl,
            width: MediaQuery.of(context).size.width - 48,
            fit: BoxFit.cover,),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.black26
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title,style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),),
                SizedBox(height: 6,),
                Text(desc,style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                ),)
              ],
            ),
          )
        ],
      ),
    );
  }
}

