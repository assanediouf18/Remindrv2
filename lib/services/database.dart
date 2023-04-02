import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:remindr/models/reminder.dart';

class DatabaseService
{
  final int userId;
  final db = FirebaseFirestore.instance;
  late final remCollection;

  DatabaseService({required this.userId}) {
    remCollection = db.collection("reminders");
  }

  Reminder _snapshotToReminders(snapshot) {
    final  data = snapshot.data();
    return Reminder(
        name: data["name"],
        remID: data["remID"],
        nextRem: data["nextRem"],
        maxRemNb: data["maxRemNb"]
    );
  }

  Stream<List<Reminder>> get reminders {
    return remCollection.where("uid", isEqualTo: userId)
        .orderBy("nextRem")
        .get().then(
        (querySnapshot) {
          querySnapshot.map((snapshot) => _snapshotToReminders(snapshot));
        },
      onError: (e) => null,
    );
  }
}