import 'package:book_api/models/books.dart';
import 'package:flutter/material.dart';

class BookDetailAccessInfo extends StatelessWidget {
  final Books book;
  const BookDetailAccessInfo(this.book, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Access Info', style: Theme.of(context).textTheme.headline6),
            const SizedBox(height: 12),
            Text('Country : ${book.accessInfo?.country ?? 'No data'}',
                style: Theme.of(context).textTheme.bodyText1),
            Text('Embeddable : ${book.accessInfo?.embeddable ?? 'No data'}',
                style: Theme.of(context).textTheme.bodyText1),
            Text(
                'Public Domain : ${book.accessInfo?.publicDomain ?? 'No data'}',
                style: Theme.of(context).textTheme.bodyText1),
            Text('Viewability : ${book.accessInfo?.viewability ?? 'No data'}',
                style: Theme.of(context).textTheme.bodyText1),
          ],
        ),
      ),
    );
  }
}
