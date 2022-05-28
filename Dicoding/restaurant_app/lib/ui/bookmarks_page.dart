import 'package:flutter/material.dart';

class BookmarksPage extends StatelessWidget {
  static const routeName = '/bookmark_page';
  const BookmarksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text('Bookmark Page')),
    );
  }
}
