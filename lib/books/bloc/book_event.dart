abstract class BookEvent {}

class QueryBookEvent extends BookEvent {
  final String query;
  QueryBookEvent(this.query);
}

class LoadMoreBookEvent extends BookEvent {}
