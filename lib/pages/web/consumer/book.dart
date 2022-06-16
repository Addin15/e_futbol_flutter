import 'package:flutter/material.dart';

class ArenaBook extends StatefulWidget {
  const ArenaBook({Key? key}) : super(key: key);

  @override
  State<ArenaBook> createState() => _ArenaBookState();
}

class _ArenaBookState extends State<ArenaBook> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Book'),
    );
  }
}
