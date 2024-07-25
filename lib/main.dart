import 'package:animal_app/features/Splash/presentation/views/screens/Splash_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoTextTheme(
          Theme.of(context).textTheme,
        ),
        scaffoldBackgroundColor: Colors.white,
        // appBarTheme: const AppBarTheme(
        //   backgroundColor: Colors.teal,
        //   centerTitle: true,
        // ),
        // colorScheme: ColorScheme.fromSwatch().copyWith(
        //   primary: Colors.teal,
        //   secondary: Colors.tealAccent,
        // ),
      ),
      home: const Splash_view(),
    );
  }
}
