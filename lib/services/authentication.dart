import 'package:firebase_auth/firebase_auth.dart';
import '../models/user.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<ReminderUser?>? get user {
    return _firebaseAuth.authStateChanges().map((user) => _reminderUserFromFirebaseUser(user));
  }

  ReminderUser? _reminderUserFromFirebaseUser(User? user) {
    return (user != null) ? ReminderUser(user.uid) : null;
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }

  //Sign in with email and password
  Future signInWithEmailPassword(String email, String password) async
  {
    try{
      dynamic result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return result.user;
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //Register with email and password
  Future registerWithEmailPassword(String email, String password) async
  {
    try {
      dynamic result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return result.user;
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  //Log out
  Future signOut() async
  {
    try {
      return await _firebaseAuth.signOut();
    } catch(e) {
      return null;
    }
  }
}