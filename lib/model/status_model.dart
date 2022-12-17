import 'package:cloud_firestore/cloud_firestore.dart';

class StatusModel {
  String id;
  String status;

  StatusModel({required this.id, required this.status});

  factory StatusModel.fromSnapshot(DocumentSnapshot snapshot) {
    return StatusModel(id: snapshot.id, status: snapshot["status"]);
  }
}
