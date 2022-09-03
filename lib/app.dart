import 'package:book_api/books/bloc/book_bloc.dart';
import 'package:book_api/books/views/book_home.dart';
import 'package:book_api/repository/book_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: BlocProvider(
        create: (context) => BookBloc(BookRepository()),
        child: const BookHome(),
      ),
    );
  }
}
