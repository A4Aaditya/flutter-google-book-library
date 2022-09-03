import 'dart:async';

import 'package:book_api/books/bloc/book_event.dart';
import 'package:book_api/books/bloc/book_state.dart';
import 'package:book_api/repository/book_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final BookRepository repository;
  final searchController = TextEditingController();
  BookBloc(this.repository) : super(BookState.init()) {
    on<QueryBookEvent>(_query);
    on<LoadMoreBookEvent>(_loadMore);
  }

  FutureOr<void> _query(
    QueryBookEvent event,
    Emitter<BookState> emit,
  ) async {
    const index = 0;
    final query = event.query;
    try {
      final loadingState = BookState(
        books: [],
        isAllLoaded: false,
        status: BookStateStatus.loading,
        query: query,
      );

      emit(loadingState);
      final response = await repository.fetch(query, index);

      final successState = BookState(
        books: response,
        isAllLoaded: false,
        status: BookStateStatus.success,
        query: query,
      );

      emit(successState);
    } catch (e) {
      final errorState = BookState(
        books: [],
        isAllLoaded: false,
        status: BookStateStatus.error,
        query: query,
      );
      emit(errorState);
    }
  }

  FutureOr<void> _loadMore(
    LoadMoreBookEvent event,
    Emitter<BookState> emit,
  ) async {
    final currentState = state;
    final loadingState = BookState(
      books: currentState.books,
      isAllLoaded: currentState.isAllLoaded,
      query: currentState.query,
      status: BookStateStatus.loadingMore,
    );
    emit(loadingState);
    try {
      final index = currentState.books.length;
      final query = currentState.query;
      final response = await repository.fetch(query, index);
      final successState = BookState(
        books: currentState.books + response,
        isAllLoaded: response.length < 10,
        status: BookStateStatus.success,
        query: query,
      );
      emit(successState);
    } catch (e) {
      final errorState = BookState(
        books: currentState.books,
        isAllLoaded: currentState.isAllLoaded,
        query: currentState.query,
        status: BookStateStatus.error,
      );
      emit(errorState);
    }
  }
}
