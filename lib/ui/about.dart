import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../common/theme_controller.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final bool isDark = notifier.value == ThemeMode.dark;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Created By Ipii",
              style: GoogleFonts.montserrat(
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Center(child: Text("Ver 1.0.0", style: GoogleFonts.montserrat())),
        ],
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("About"),
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
            ListTile(
              title: Text("Quotes"),
              leading: Icon(Icons.book),
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
            ListTile(title: Text("About"), leading: Icon(Icons.info)),
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
