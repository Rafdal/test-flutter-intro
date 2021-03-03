import 'package:flutter/material.dart';
import 'package:flutter_intro/frontend/screens/home_page.dart';
import 'package:flutter_intro/frontend/screens/splash_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test',
      // darkTheme: ThemeData( primaryColor: Colors.grey[800], ),
      // theme: ThemeData( primaryColor: Colors.blue, ),
      // themeMode: ThemeMode.system,
      
      // home: SplashScreen(),
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => HomePage(),
        // '/welcome': (context) => WelcomePage(), // Página de onboarding
      },
      initialRoute: '/',
    );
  }
}