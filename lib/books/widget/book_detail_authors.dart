import 'package:book_api/models/books.dart';
import 'package:flutter/material.dart';

class BookDetailAuthor extends StatelessWidget {
  final Books book;
  const BookDetailAuthor(this.book, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${book.volumeInfo?.title}',
              maxLines: 10,
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              '${book.volumeInfo?.authors?[0]}',
              style: Theme.of(context)
                  .textTheme
                  .subtitle2
                  ?.copyWith(color: Colors.grey.shade700),
            ),
            Visibility(
              visible: book.volumeInfo?.publisher != null,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    '${book.volumeInfo?.publisher}',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    'Publisher',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: Colors.grey.shade700),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
