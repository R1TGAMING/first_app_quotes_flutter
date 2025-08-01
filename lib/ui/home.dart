import 'package:flutter/material.dart';
import 'package:my_first_app/widget/widget.dart';
import 'about.dart';
import '../common/theme_controller.dart';

class HomePage extends StatefulWidget {
  final VoidCallback? onPressed;

  HomePage({this.onPressed});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final bool isDark = notifier.value == ThemeMode.dark;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [CardWidget(widget: QuoteWidget())],
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Quotes"),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            ListTile(title: Text("Quotes"), leading: Icon(Icons.book)),
            ListTile(
              title: Text("About"),
              leading: Icon(Icons.info),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => About()),
                );
              },
            ),
            ListTile(
              title: isDark ? Text("Light Mode") : Text("Dark Mode"),
              leading: Icon(isDark ? Icons.wb_sunny : Icons.nightlight_round),
              onTap: () {
                notifier.value = isDark ? ThemeMode.light : ThemeMode.dark;
              },
            ),
          ],
        ),
      ),
    );
  }
}
