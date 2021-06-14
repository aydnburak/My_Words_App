class Word {
  final String? userID;
  String? tr;
  String? en;

  Word({required this.userID, required this.tr, required this.en});

  @override
  String toString() {
    return 'Word{userID: $userID, tr: $tr, en: $en}';
  }

  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'tr': tr,
      'en': en,
    };
  }

  Word.fromMap(Map<String, dynamic> map)
      : userID = map['userID'],
        tr = map['tr'],
        en = map['en'];
}
