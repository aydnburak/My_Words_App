import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_words_app/models/word.dart';

abstract class DbBase {
  Future<bool> addWord(Word word);

  Future<List<Word>> getAllWord(String userID);
}

class FirestoreService implements DbBase {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<bool> addWord(Word word) async {
    try {
      await _firestore.collection("words").doc(word.userID).collection("myWords").add(word.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<Word>> getAllWord(String userID) async {
    List<Word> list = [];
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection("words").doc(userID).collection("myWords").get();
      for (QueryDocumentSnapshot tekWord in querySnapshot.docs) {
        list.add(Word.fromMap(tekWord.data() as Map<String, dynamic>));
      }
      return list;
    } catch (e) {
      return list;
    }
  }
}
