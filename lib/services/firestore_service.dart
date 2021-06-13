import 'package:cloud_firestore/cloud_firestore.dart';

abstract class DbBase {}

class FirestoreService implements DbBase {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
}
