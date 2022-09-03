class BookSaleInfo {
  String country;
  String saleability;
  bool isEbook;

  BookSaleInfo({
    required this.country,
    required this.saleability,
    required this.isEbook,
  });
  factory BookSaleInfo.fromMap(Map<String, dynamic> e) {
    return BookSaleInfo(
      country: e['country'],
      saleability: e['saleability'],
      isEbook: e['isEbook'],
    );
  }
}
