import 'dart:math';

import 'package:get/get.dart';
import 'package:my_words_app/constants/colors.dart';
import 'package:my_words_app/locator.dart';
import 'package:my_words_app/models/question.dart';
import 'package:my_words_app/models/word.dart';
import 'package:my_words_app/repositorys/firestore_repository.dart';

class WordsController extends GetxController {
  String userID;

  WordsController({required this.userID}) {
    myInit();
  }

  Future<void> myInit() async {
    await getAllWord(userID);
    getQuestion();
  }

  final FirestoreRepository _firestoreRepository = locator<FirestoreRepository>();

  RxList _allWords = [].obs;
  late Question _question;

  RxInt _correctScore = 0.obs;
  RxInt _wrongScore = 0.obs;
  RxBool _isQuestion = false.obs;

  RxBool get isQuestion => _isQuestion;

  RxList get allWords => _allWords;

  Question get question => _question;

  RxInt get correctScore => _correctScore;

  RxInt get wrongScore => _wrongScore;

  Future<void> addWord(Word word) async {
    _allWords.add(word);
    await _firestoreRepository.addWord(word);
    Get.snackbar("Add", "Word Added.", backgroundColor: AppColors.green);
  }

  Future<void> getAllWord(String userID) async {
    _allWords.value = await _firestoreRepository.getAllWord(userID);
    _listDoldur();
  }

  void _listDoldur() {
    List<String> enlist = [
      "Hello",
      "Today",
      "Morning",
      "Excuse me",
      "Up",
      "Medium",
      "Long",
      "Who?",
      "Happy years",
      "Where?"
    ];
    List<String> trlist = [
      "Merhaba",
      "Bugün",
      "Sabah",
      "Özür dilerim",
      "Yukarıda",
      "Orta",
      "Uzun",
      "Kim?",
      "Mutlu yıllar",
      "Nerede?"
    ];
    for (int i = 0; i < trlist.length; i++) {
      _allWords.add(Word(userID: "", tr: trlist[i], en: enlist[i]));
    }
  }

  void getQuestion() {
    List<Answer> _answers = [];
    var rng = new Random();
    List<int> _counters = getCounters();
    for (var i = 0; i < 4; i++) {
      _answers.add(Answer(tr: _allWords[_counters[i]].tr!, en: _allWords[_counters[i]].en!));
    }
    _question = Question(question: _answers[rng.nextInt(4)], answers: _answers);
    _isQuestion.value = false;
    _isQuestion.value = true;
  }

  void testReset() {
    _correctScore.value = 0;
    _wrongScore.value = 0;
    getQuestion();
  }

  void soruKontrol(int deger) {
    if (_question.question.tr == _question.answers[deger].tr) {
      _question.answers[deger].isActive = true;
      _question.isLock = true;

      if (_question.status == false) {
        _correctScore.value++;
        _question.status = true;
      }
    } else {
      _question.answers[deger].isActive = false;
      if (_question.status == false) {
        wrongScore.value++;
        _question.status = true;
      }
    }
    _isQuestion.value = false;
    _isQuestion.value = true;
    print("bas");
  }

  List<int> getCounters() {
    List<int> counters = [];
    var rnd = new Random();
    int i = 0;
    while (i < 4) {
      int sayi = rnd.nextInt(_allWords.length);
      if (!counters.contains(sayi)) {
        counters.add(sayi);
        i++;
      }
    }
    return counters;
  }
}
