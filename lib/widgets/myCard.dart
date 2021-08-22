import 'package:flutter/material.dart';

class MyCard extends StatefulWidget {
  final String content;
  final void Function() onTap;
  MyCard({this.content, this.onTap});
  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 40,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Text(widget.content)),
        ),
      ),
    );
  }
}