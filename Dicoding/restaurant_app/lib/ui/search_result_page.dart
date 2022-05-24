import 'package:flutter/material.dart';

class SearchResultPage extends StatelessWidget {
  static const routeName = '/search_result_page';
  final String query;
  const SearchResultPage({Key? key, required this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(query),
    );
  }
}
