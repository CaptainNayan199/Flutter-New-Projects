import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addTodayWork(Map<String, dynamic> userTodayMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Today")
        .doc(id)
        .set(userTodayMap);
  }

  Future addTomorrowWork(Map<String, dynamic> userTodayMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Tomorrow")
        .doc(id)
        .set(userTodayMap);
  }

  Future addNextWeekWork(Map<String, dynamic> userTodayMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Next Week")
        .doc(id)
        .set(userTodayMap);
  }

  Future<Stream<QuerySnapshot>> getAllTheWork(String day) async {
    return await FirebaseFirestore.instance.collection(day).snapshots();
  }

  updateIfTricked(String id, String day) async {
    return await FirebaseFirestore.instance
        .collection(day)
        .doc(id)
        .update({"Yes": true});
  }

  Future deleteWork(String id, String day) async {
    return await FirebaseFirestore.instance.collection(day).doc(id).delete();
  }
}
