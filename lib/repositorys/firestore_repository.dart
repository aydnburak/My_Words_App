import 'package:my_words_app/locator.dart';
import 'package:my_words_app/models/word.dart';
import 'package:my_words_app/services/firestore_service.dart';

class FirestoreRepository implements DbBase {
  final FirestoreService _firestoreService = locator<FirestoreService>();

  @override
  Future<bool> addWord(Word word) async {
    return await _firestoreService.addWord(word);
  }

  @override
  Future<List<Word>> getAllWord(String userID) async {
    return await _firestoreService.getAllWord(userID);
  }
}
