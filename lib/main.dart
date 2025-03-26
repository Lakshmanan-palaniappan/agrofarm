import 'package:agrofarm/Screens/login_page.dart';
import 'package:agrofarm/Screens/onboarding_screen.dart';
import 'package:agrofarm/Screens/splash_screen.dart';
import 'package:agrofarm/utils/screen_sizes.dart';
import 'package:flutter/material.dart';

import 'Screens/registration_screen.dart';

void main() {
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Agro Farm',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 97, 52, 173)),
        useMaterial3: true,
      ),
      home: OnBoard(),
    );
  }
}


