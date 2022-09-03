class BookVolumneInfoImageLinks {
  String? smallThumbnail;
  String? thumbnail;
  BookVolumneInfoImageLinks({
    required this.smallThumbnail,
    required this.thumbnail,
  });
  factory BookVolumneInfoImageLinks.fromMap(Map<String, dynamic> e) {
    return BookVolumneInfoImageLinks(
      smallThumbnail: e['smallThumbnail'],
      thumbnail: e['thumbnail'],
    );
  }
}
