import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ui/home.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ValueNotifier _notifier = ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ValueListenableBuilder(
      valueListenable: _notifier,
      builder: (_, mode, _) {
        return MaterialApp(
          themeMode: mode,

          darkTheme: ThemeData(
            fontFamily: GoogleFonts.montserrat().fontFamily,
            brightness: Brightness.dark,
          ),
          debugShowCheckedModeBanner: false,
          home: HomePage(
            onPressed: () => {
              _notifier.value = mode == ThemeMode.light
                  ? ThemeMode.dark
                  : ThemeMode.light,
            },
          ),
          theme: ThemeData(
            fontFamily: GoogleFonts.montserrat().fontFamily,
            brightness: Brightness.light,
          ),
        );
      },
    );
  }
}
