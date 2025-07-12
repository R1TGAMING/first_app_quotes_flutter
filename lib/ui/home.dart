import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_app/widget/widget.dart';

class HomePage extends StatefulWidget {
  final VoidCallback onPressed;

  HomePage({required this.onPressed});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: widget.onPressed,
        child: Icon(CupertinoIcons.moon, color: Colors.black),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsetsGeometry.all(20),
            child: Container(child: QuoteWidget()),
          ),
        ],
      ),
      appBar: AppBar(title: Text("Quotes")),
    );
  }
}
