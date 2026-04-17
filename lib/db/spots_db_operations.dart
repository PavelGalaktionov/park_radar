import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:park_radar/utils/constants.dart';

import '../utils/utils_functions.dart';

Future<QuerySnapshot<Map<String, dynamic>>> getTestMessage() {
  return testReference.get();
}