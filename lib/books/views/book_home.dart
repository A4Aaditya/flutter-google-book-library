import 'package:book_api/books/bloc/book_bloc.dart';
import 'package:book_api/books/bloc/book_event.dart';
import 'package:book_api/books/bloc/book_state.dart';
import 'package:book_api/books/widget/book_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookHome extends StatelessWidget {
  const BookHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.select((BookBloc bloc) => bloc.searchController);

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Book Library',
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Search Books',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    final bloc = context.read<BookBloc>();
                    final input = controller.text;
                    bloc.add(QueryBookEvent(input));
                  },
                  icon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
          BlocBuilder<BookBloc, BookState>(
            builder: (context, state) {
              switch (state.status) {
                case BookStateStatus.initial:
                  return const Text('Search Books');
                case BookStateStatus.loadingMore:
                  if (state.books.isEmpty) {
                    return const Text('No book to show');
                  }
                  return Expanded(child: BookList(state));
                case BookStateStatus.success:
                  if (state.books.isEmpty) {
                    return const Text('No book to show');
                  }
                  return Expanded(child: BookList(state));
                case BookStateStatus.loading:
                  return const Center(child: CircularProgressIndicator());
                case BookStateStatus.error:
                  return const Text('Something went wrong');
              }
            },
          )
        ],
      ),
    );
  }
}
