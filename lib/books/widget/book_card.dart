import 'package:book_api/books/views/book_detail.dart';
import 'package:book_api/models/books.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final Books book;
  const BookCard(
    this.book, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authors = book.volumeInfo?.authors?[0] ?? 'No data';
    final thumbnail = book.volumeInfo?.imageLinks?.thumbnail;
    return Card(
      child: InkWell(
        onTap: () {
          final route = MaterialPageRoute(
            builder: (context) => BookDetail(book),
          );
          Navigator.push(context, route);
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
                width: 150,
                child: Hero(
                  tag: 'image ${book.id}',
                  child: thumbnail == null
                      ? Container(
                          width: 150,
                          height: 200,
                          color: Colors.cyan,
                          child: Center(
                            child: Text(
                              'No Image Available',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ),
                        )
                      : Image.network(
                          thumbnail,
                          fit: BoxFit.fill,
                        ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      '$authors',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      book.volumeInfo?.title ?? 'No data',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          ?.copyWith(color: Colors.grey.shade600),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Publisher : ${book.volumeInfo?.publisher ?? 'No data'}',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    Text(
                      'Average Rating : ${book.volumeInfo?.averageRating ?? 'No data'}',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    Text(
                      'Page Count : ${book.volumeInfo?.pageCount ?? 'No data'}',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    Text(
                      'Categories : ${book.volumeInfo?.categories?[0] ?? 'No data'}',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    Text(
                      'Publish Year : ${book.volumeInfo?.publishedDate ?? 'No data'}',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
