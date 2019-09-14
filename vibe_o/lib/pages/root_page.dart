import 'package:flutter/material.dart';
import 'package:vibe_o/base_auth/auth.dart';

import '../base_auth/provider.dart';
import './auth_page.dart';
import './home_page.dart';

enum AuthState {
  NotSignedIn,
  SignedIn,
}

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    final Auth auth = Provider.of(context).baseAuth;

   return StreamBuilder<String>(
      stream: auth.onAuthStateChanged,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final bool loggedIn = snapshot.hasData;
          return loggedIn ? HomePage() : AuthPage();
        }

        return Scaffold(
          body: CircularProgressIndicator(),
        );
      },
    );
  }
}
