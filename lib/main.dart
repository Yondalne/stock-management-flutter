import 'package:flutter/material.dart';
import 'package:stock_management/widgets/pages/HomeScreen.dart';
import 'package:stock_management/widgets/pages/LoginScreen.dart';
import 'package:stock_management/widgets/pages/RegisterScreen.dart';
import 'package:stock_management/widgets/pages/Resources/CreateScreen.dart';
import 'package:stock_management/widgets/pages/Resources/ListScreen.dart';

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
      theme: ThemeData(fontFamily: 'Jost'),
      home: LoginScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/resource': (context) => ResourceList(),
        '/resource/create': (context) => CreateResource(),
        '/resource/edit': (context) => CreateResource(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
      },
    );
  }
}
