import 'package:flutter/material.dart';
import 'package:my_first_app/network/network.dart';

class QuoteWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QuoteWidget();
}

class _QuoteWidget extends State<QuoteWidget> {
  late Future<QuoteApi> response;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    response = fetchQuote();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder<QuoteApi>(
      future: response,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final quote = snapshot.data!.quote;
          final author = snapshot.data!.author;

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsetsGeometry.all(20),
                      child: Center(
                        child: Text(
                          '" $quote "',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsGeometry.directional(bottom: 20),
                      child: Text(
                        "- $author -",
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                    ),
                  ],
                ),
              ),

              OutlinedButton(
                onPressed: () {
                  setState(() {
                    response = fetchQuote();
                  });
                },
                style: OutlinedButton.styleFrom(overlayColor: Colors.black),
                child: Text(
                  "Refresh",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return Padding(
            padding: EdgeInsetsGeometry.all(20),
            child: Center(
              child: Text(
                'Error: ${snapshot.error}',
                textAlign: TextAlign.center,
              ),
            ),
          );
        }

        return Center(child: CircularProgressIndicator(color: Colors.black));
      },
    );
  }
}
