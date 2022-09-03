class BookAccessInfo {
  String country;
  String viewability;
  bool embeddable;
  bool publicDomain;
  String textToSpeechPermission;
  String webReaderLink;
  String accessViewStatus;
  bool quoteSharingAllowed;
  BookAccessInfoPdf? pdf;
  BookAccessInfoEpub? epub;

  BookAccessInfo({
    required this.country,
    required this.viewability,
    required this.embeddable,
    required this.publicDomain,
    required this.textToSpeechPermission,
    required this.webReaderLink,
    required this.accessViewStatus,
    required this.quoteSharingAllowed,
    required this.pdf,
    required this.epub,
  });
  factory BookAccessInfo.fromMap(Map<String, dynamic> e) {
    final pdfMap = e['pdf'];
    final pdf = pdfMap == null ? null : BookAccessInfoPdf.fromMap(pdfMap);
    final epubMap = e['epub'];
    final epub = BookAccessInfoEpub.fromMap(epubMap);
    return BookAccessInfo(
      accessViewStatus: e['accessViewStatus'],
      country: e['country'],
      embeddable: e['embeddable'],
      publicDomain: e['publicDomain'],
      quoteSharingAllowed: e['quoteSharingAllowed'],
      textToSpeechPermission: e['textToSpeechPermission'],
      viewability: e['viewability'],
      webReaderLink: e['webReaderLink'],
      pdf: pdf,
      epub: epub,
    );
  }
}

class BookAccessInfoPdf {
  bool isAvailable;

  BookAccessInfoPdf({
    required this.isAvailable,
  });
  factory BookAccessInfoPdf.fromMap(Map<String, dynamic> e) {
    return BookAccessInfoPdf(
      isAvailable: e['isAvailable'],
    );
  }
}

class BookAccessInfoEpub {
  bool isAvailable;

  BookAccessInfoEpub({required this.isAvailable});

  factory BookAccessInfoEpub.fromMap(Map<String, dynamic> e) {
    return BookAccessInfoEpub(isAvailable: e['isAvailable']);
  }
}
