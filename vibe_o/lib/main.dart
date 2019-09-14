import 'package:flutter/material.dart';

// Local imports
import './commons/globals.dart';
import './base_auth/provider.dart';
import './base_auth/auth.dart';
import './pages/root_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      baseAuth: Auth(),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.blueGrey,
          primarySwatch: Colors.cyan,
        ),
        title: Globals.APP_NAME,
        debugShowCheckedModeBanner: false,
        home: RootPage(),
        initialRoute: 'rootPage',
        routes: Globals.routes,
      ),
    );
  }
}
