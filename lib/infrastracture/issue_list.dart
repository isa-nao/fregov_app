import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fregov_app/models/issue_model.dart';

final allIssueListProvider = StreamProvider<List<Issue>>((ref) {
  CollectionReference ref = FirebaseFirestore.instance.collection('issues');
  return ref.orderBy('updateTime', descending: true).snapshots().map((snapshot) => snapshot.docs
      .map((doc) => doc.data()! as Map<String, dynamic>)
      .map((e) => Issue.fromJson(e)).toList());
});