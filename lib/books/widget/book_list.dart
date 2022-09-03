import 'package:book_api/books/bloc/book_bloc.dart';
import 'package:book_api/books/bloc/book_event.dart';
import 'package:book_api/books/bloc/book_state.dart';
import 'package:book_api/books/widget/book_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookList extends StatelessWidget {
  final BookState state;
  const BookList(this.state, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final books = state.books;
    final isAllLoaded = state.isAllLoaded;
    return ListView.builder(
      itemCount: isAllLoaded ? books.length : books.length + 1,
      itemBuilder: (context, index) {
        if (index < books.length) {
          final book = books[index];
          return BookCard(book);
        }
        if (state.status == BookStateStatus.loadingMore) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.status == BookStateStatus.error) {
          return const Center(child: Text('Unable to load more content'));
        } else {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {
                context.read<BookBloc>().add(LoadMoreBookEvent());
              },
              child: const Text('Load More'),
            ),
          );
        }
      },
    );
  }
}
