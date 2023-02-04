import 'package:flutter/material.dart';
import 'pages/homePage.dart';
void main()
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travelling App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
               useMaterial3: true,
               scaffoldBackgroundColor:Color(0xff1E2126),
               colorScheme:const ColorScheme.dark(
               surface:  Color(0xffE84711),
               primary: Color(0xffE84711),
           ),

      ),
      home: Homepage(),
    );
  }
}
