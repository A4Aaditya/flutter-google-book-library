import 'package:book_api/books/widget/book_detail_access.dart';
import 'package:book_api/books/widget/book_detail_authors.dart';
import 'package:book_api/books/widget/book_detail_rating.dart';
import 'package:book_api/models/books.dart';
import 'package:flutter/material.dart';
import 'package:read_more_text/read_more_text.dart';

class BookDetail extends StatelessWidget {
  final Books book;
  const BookDetail(this.book, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final thumbnail = book.volumeInfo?.imageLinks?.smallThumbnail;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            snap: true,
            floating: true,
            expandedHeight: 360.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              titlePadding: const EdgeInsetsDirectional.only(
                start: 27,
                bottom: 16,
              ),
              title: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  '${book.volumeInfo?.authors?[0]}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              background: Hero(
                tag: 'image ${book.id}',
                child: thumbnail == null
                    ? Container(
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        color: Colors.cyan,
                        child: Center(
                          child: Text(
                            'No Image Available',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ))
                    : Image.network(
                        thumbnail,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                      ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BookDetailAuthor(book),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Description',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          const SizedBox(height: 12),
                          ReadMoreText(
                            '${book.volumeInfo?.description}',
                            numLines: 2,
                            readMoreText: 'Read More',
                            readLessText: 'Show Less',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                    ),
                  ),
                  BookDetailRating(book),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Sale Info',
                              style: Theme.of(context).textTheme.headline6),
                          const SizedBox(height: 12),
                          Text(
                              'Country : ${book.saleInfo?.country ?? 'No data'}',
                              style: Theme.of(context).textTheme.bodyText1),
                          Text(
                              'Sale Ability : ${book.saleInfo?.saleability ?? 'No data'}',
                              style: Theme.of(context).textTheme.bodyText1),
                          Text('Ebook : ${book.saleInfo?.isEbook ?? 'No data'}',
                              style: Theme.of(context).textTheme.bodyText1),
                        ],
                      ),
                    ),
                  ),
                  BookDetailAccessInfo(book),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
