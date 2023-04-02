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
}