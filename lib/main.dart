import 'package:flutter/material.dart';
import 'loginscreen.dart';
import 'main_page.dart'; // Import the MainPage class (assuming you have created this class).

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Application Pointage',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute:
          '/login', // Set the initial route to '/login' (the login screen).
      routes: {
        '/login': (context) => LoginScreen(),
        '/mainPage': (context) =>
            MainPage(), // Add the main screen to the routes.
      },
    );
  }
}
