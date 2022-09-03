class BookSearchInfo {
  String? textSnippet;

  BookSearchInfo({required this.textSnippet});
  factory BookSearchInfo.fromMap(Map<String, dynamic> e) {
    return BookSearchInfo(textSnippet: e['textSnippet']);
  }
}
