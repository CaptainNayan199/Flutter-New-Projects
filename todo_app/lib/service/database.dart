import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{
  Future addTodayWork(Map<String, dynamic> userTodayMap, String id) async{
    return await FirebaseFirestore.instance.collection("Today").doc(id).set(userTodayMap); 
  }
}

