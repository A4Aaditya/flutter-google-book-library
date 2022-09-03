import 'package:book_api/models/books_access_info.dart';
import 'package:book_api/models/books_sale_info.dart';
import 'package:book_api/models/books_search_info.dart';
import 'package:book_api/models/books_volume_info.dart';

class Books {
  String kind;
  String id;
  String etag;
  String selfLink;
  BookVolumneInfo? volumeInfo;
  BookSaleInfo? saleInfo;
  BookAccessInfo? accessInfo;
  BookSearchInfo? searchInfo;

  Books({
    required this.id,
    required this.kind,
    required this.etag,
    required this.selfLink,
    required this.volumeInfo,
    required this.saleInfo,
    required this.accessInfo,
    required this.searchInfo,
  });

  factory Books.fromMap(Map<String, dynamic> json) {
    final volumeMap = json['volumeInfo'];
    final volumeInfo =
        volumeMap == null ? null : BookVolumneInfo.fromMap(json['volumeInfo']);
    final saleMap = json['saleInfo'];
    final saleInfo = saleMap == null ? null : BookSaleInfo.fromMap(saleMap);
    final accessMap = json['accessInfo'];
    final accessInfo = BookAccessInfo.fromMap(accessMap);
    final searchMap = json['searchInfo'];
    final searchInfo =
        searchMap == null ? null : BookSearchInfo.fromMap(searchMap);
    return Books(
      kind: json['kind'],
      id: json['id'],
      etag: json['etag'],
      selfLink: json['selfLink'],
      volumeInfo: volumeInfo,
      saleInfo: saleInfo,
      accessInfo: accessInfo,
      searchInfo: searchInfo,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Books &&
        other.kind == kind &&
        other.id == id &&
        other.etag == etag &&
        other.selfLink == selfLink &&
        other.volumeInfo == volumeInfo;
  }

  @override
  int get hashCode {
    return kind.hashCode ^
        id.hashCode ^
        etag.hashCode ^
        selfLink.hashCode ^
        volumeInfo.hashCode;
  }
}
