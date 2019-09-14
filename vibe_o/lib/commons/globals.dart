import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Pages
import '../pages/root_page.dart';
import '../pages/auth_page.dart';
import '../pages/home_page.dart';

class Globals {
  static const String APP_NAME = 'Vibe O';
  static Map<String, WidgetBuilder> routes = {
    'rootPage': (BuildContext context) => RootPage(),
    'authPage': (BuildContext context) => AuthPage(),
    'homePage': (BuildContext context) => HomePage(),
  };

  static FirebaseUser currentUser;

  static String email;
  static String password;
}
