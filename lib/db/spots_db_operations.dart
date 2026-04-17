import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:park_radar/utils/constants.dart';

import '../utils/utils_functions.dart';

Future<QuerySnapshot<Map<String, dynamic>>> getTestMessage() async {
  final doc = await FirebaseFirestore.instance
      .collection('test')
      .doc('TTITDJuS4PHWVAvYQ3bT')
      .get();

  print('DOC EXISTS: ${doc.exists}');
  print('DOC DATA: ${doc.data()}');

  final snap = await FirebaseFirestore.instance
      .collection('test')
      .limit(1)
      .get();

  print('COUNT: ${snap.docs.length}');

  return testReference.get();
}