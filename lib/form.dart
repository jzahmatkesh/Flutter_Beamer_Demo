import 'package:beamer/src/beamer.dart';
import 'package:flutter/material.dart';

class Book{
  final int id;
  final String name;
  final double price;

  Book(this.id, this.name, this.price);
}

final books = [
  Book(1, 'Flutter for begginers', 1500),
  Book(2, 'Flutter for advance', 2500),
  Book(3, 'Sql Server for dummies', 1200),
  Book(4, 'Node js for web developer', 1000),
  Book(5, 'Linux for Pro', 3000)
];

class BookList extends StatelessWidget {
  const BookList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: books.map((e) => ListTile(
            title: Text(e.name), 
            leading: const Icon(Icons.book),
            onTap: ()=>context.beamToNamed('/books/${e.id}'),
          )).toList()
        ),
      ),
    );
  }
}

class BookDetail extends StatelessWidget {
  final Book? book;
  const BookDetail({this.book, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: book == null ? const Text('Book not found') : Text(book!.name),
      ),
      body: book != null
        ? Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('name: ${book!.name}'),
                Text('Price: ${book!.price}'),
              ],
            ),
          )
        : const SizedBox.shrink()
    );
  }
}