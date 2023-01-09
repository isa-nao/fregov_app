import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fregov_app/models/issue_model.dart';

final issueListProvider = StreamProvider.autoDispose((ref) {
  CollectionReference ref = FirebaseFirestore.instance.collection('issues');
  return ref.snapshots().map((snapshot) => snapshot.docs
      .map((doc) => doc.data()! as Map<String, dynamic>)
      .map((data) => Issue(
        cityName: data['cityName'],
        issueTitle: data['issueTitle'],
        updateTime: data['updateTime'],
        detailUrl: data['detailUrl'],
      ))
      .toList());
});