import 'package:flutter/material.dart';
import 'package:pdpui_intro/Pages/HomePage.dart';
import 'package:pdpui_intro/Pages/Intro_Page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: IntroPage(),
      routes: {
        HomePage.id:(context)=>HomePage(),
        IntroPage.id:(context)=>IntroPage(),
      },
    );
  }
}
