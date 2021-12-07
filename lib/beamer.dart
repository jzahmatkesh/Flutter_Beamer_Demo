import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:tst/form.dart';
import 'package:tst/homepage.dart';

class BooksLocation extends BeamLocation<BeamState>{
  @override
  List<Pattern> get pathPatterns => ['/books/:bookId'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      const BeamPage(
        key: ValueKey('home'),
        title: 'Home',
        child: MyHomePage()
      ),
      if (state.uri.pathSegments.contains('books'))
        const BeamPage(
          key: ValueKey('books'),
          title: 'Books',
          child: BookList()
        )
    ];
    
    final String? bookid = state.pathParameters['bookId'];
    if (bookid != null){
      final _id = int.tryParse(bookid);
      final book = books.where((element) => element.id==_id).isNotEmpty
        ? books.firstWhere((element) => element.id == _id)
        : null;
      pages.add(
        BeamPage(
          key: ValueKey('book-$bookid'),
          title: 'Book $bookid',
          child: BookDetail(book: book)
        )
      );
    }

    return pages;
  }
}