import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz_maker/models/user.dart';

class AuthService{
  FirebaseAuth _auth = FirebaseAuth.instance;
  UsersId _userFromFirebaseUser(User user){
    return user!= null ? UsersId(uid: user.uid) : null;
  }

  // sign in
  Future signInEmailAndPassword(String email, String password) async{
    try{
      //AuthResult authResult=  await _auth.signInWithEmailAndPassword(email: email, password: password);
      User firebaseUser=(await _auth.signInWithEmailAndPassword(email: email, password: password)).user;
      return _userFromFirebaseUser(firebaseUser);
    }catch(e){
      print(e.toString());
    }
  }

  //sing up
  Future signUpEmailAndPassword(String email, String password) async{
    try{
      //AuthResult authResult=  await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User firebaseUser=(await _auth.createUserWithEmailAndPassword(email: email, password: password)).user;
      return _userFromFirebaseUser(firebaseUser);
    }catch(e){
      print(e.toString());
    }
  }


  //sign out
  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }


}