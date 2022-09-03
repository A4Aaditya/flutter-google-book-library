import 'dart:convert';
import 'package:book_api/models/books.dart';
import 'package:http/http.dart' as http;

class BookRepository {
  Future<List<Books>> fetch(String query, int index) async {
    String baseUrl = 'https://www.googleapis.com/books/v1/volumes?q=';

    String url = '$baseUrl$query&startIndex=$index';

    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body) as Map;
      final result = json['items'] as List;
      final books = result.map((e) {
        return Books.fromMap(e);
      }).toList();
      return books;
    } else {
      throw ('Error ${response.statusCode}');
    }
  }
}
