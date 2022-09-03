import 'package:book_api/models/books_vloume_info_reading_mode.dart';
import 'package:book_api/models/books_volume_info_image_link.dart';

class BookVolumneInfo {
  String? title;
  String? subtitle;
  String? publisher;
  String? publishedDate;
  String? description;
  int? pageCount;
  String? printType;
  num? averageRating;
  int? ratingsCount;
  String? maturityRating;
  bool? allowAnonLogging;
  String? contentVersion;
  String? language;
  String? previewLink;
  String? infoLink;
  String? canonicalVolumeLink;
  List? authors;
  BookVolumeInfoReadingModes? readingModes;
  List? categories;
  BookVolumneInfoImageLinks? imageLinks;

  BookVolumneInfo({
    required this.title,
    required this.subtitle,
    required this.publisher,
    required this.publishedDate,
    required this.description,
    required this.pageCount,
    required this.printType,
    required this.averageRating,
    required this.ratingsCount,
    required this.maturityRating,
    required this.allowAnonLogging,
    required this.contentVersion,
    required this.language,
    required this.previewLink,
    required this.infoLink,
    required this.canonicalVolumeLink,
    required this.authors,
    required this.readingModes,
    required this.categories,
    required this.imageLinks,
  });
  factory BookVolumneInfo.fromMap(Map<String, dynamic> e) {
    final readingMap = e['readingModes'];
    final readingModes = readingMap == null
        ? null
        : BookVolumeInfoReadingModes.fromMap(readingMap);
    final imageMap = e['imageLinks'];
    final imageLinks =
        imageMap == null ? null : BookVolumneInfoImageLinks.fromMap(imageMap);
    return BookVolumneInfo(
      allowAnonLogging: e['allowAnonLogging'],
      averageRating: e['averageRating'],
      canonicalVolumeLink: e['canonicalVolumeLink'],
      contentVersion: e['contentVersion'],
      description: e['description'],
      infoLink: e['infoLink'],
      language: e['language'],
      maturityRating: e['maturityRating'],
      pageCount: e['pageCount'],
      previewLink: e['previewLink'],
      printType: e['printType'],
      publishedDate: e['publishedDate'],
      publisher: e['publisher'],
      ratingsCount: e['ratingsCount'],
      subtitle: e['subtitle'],
      title: e['title'],
      authors: e['authors'],
      readingModes: readingModes,
      categories: e['categories'],
      imageLinks: imageLinks,
    );
  }
}
