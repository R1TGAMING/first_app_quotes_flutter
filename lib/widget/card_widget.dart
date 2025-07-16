import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final Widget widget;

  CardWidget({required this.widget});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Card(
          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
          elevation: 5,
          child: Stack(
            children: [
              Opacity(
                opacity: 0.2,
                child: Icon(Icons.format_quote_outlined, size: 140),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 50),
                child: SizedBox(width: double.infinity, child: widget),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
