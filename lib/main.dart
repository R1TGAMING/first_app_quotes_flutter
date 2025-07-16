import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ui/home.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'common/theme_controller.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ValueListenableBuilder(
      valueListenable: notifier,
      builder: (_, mode, _) {
        return MaterialApp(
          themeMode: mode,
          darkTheme: ThemeData(
            fontFamily: GoogleFonts.montserrat().fontFamily,
            brightness: Brightness.dark,
          ),
          debugShowCheckedModeBanner: false,
          home: HomePage(),
          theme: ThemeData(
            textTheme: TextTheme(
              bodyLarge: TextStyle(color: Colors.grey[800]),
              bodyMedium: TextStyle(color: Colors.grey[800]),
              titleLarge: TextStyle(color: Colors.grey[800]),
              labelLarge: TextStyle(color: Colors.grey[800]),
            ),
            fontFamily: GoogleFonts.montserrat().fontFamily,
            brightness: Brightness.light,
          ),
        );
      },
    );
  }
}
