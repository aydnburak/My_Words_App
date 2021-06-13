import 'package:cloud_firestore/cloud_firestore.dart';

class MyUser {
  final String userID;
  String? email;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;

  MyUser(
      {required this.userID,
      required this.email,
      required this.name,
      this.createdAt,
      this.updatedAt});

  @override
  String toString() {
    return 'Kullanici{userID: $userID, email: $email, name: $name, createdAt: $createdAt, updatedAt: $updatedAt}';
  }

  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'email': email,
      'name': name,
      'createdAt': createdAt ?? FieldValue.serverTimestamp(),
      'updatedAt': updatedAt ?? FieldValue.serverTimestamp(),
    };
  }

  MyUser.fromMap(Map<String, dynamic> map)
      : userID = map['userID'],
        email = map['email'],
        name = map['name'],
        createdAt = (map['createdAt'] as Timestamp).toDate(),
        updatedAt = (map['updatedAt'] as Timestamp).toDate();
}
