import 'package:book_api/models/books.dart';
import 'package:flutter/material.dart';

class BookDetailRating extends StatelessWidget {
  final Books book;
  const BookDetailRating(this.book, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Rating', style: Theme.of(context).textTheme.headline6),
            const SizedBox(height: 12),
            Text(
              'Average Rating : ${book.volumeInfo?.averageRating ?? 'No data'}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text('Rating Count : ${book.volumeInfo?.ratingsCount ?? 'No data'}',
                style: Theme.of(context).textTheme.bodyText1),
            Text(
                'Maturity Rating : ${book.volumeInfo?.maturityRating ?? 'No data'}',
                style: Theme.of(context).textTheme.bodyText1),
          ],
        ),
      ),
    );
  }
}
