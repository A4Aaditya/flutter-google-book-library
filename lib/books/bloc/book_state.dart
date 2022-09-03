import 'package:book_api/models/books.dart';

enum BookStateStatus {
  initial,
  success,
  loading,
  loadingMore,
  error,
}

class BookState {
  List<Books> books;
  final bool isAllLoaded;
  final BookStateStatus status;
  final String query;

  BookState({
    required this.books,
    required this.isAllLoaded,
    required this.status,
    required this.query,
  });

  factory BookState.init() {
    return BookState(
      books: [],
      isAllLoaded: false,
      status: BookStateStatus.initial,
      query: '',
    );
  }
}
