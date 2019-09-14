import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../base_auth/auth.dart';
import '../base_auth/provider.dart';

class HomePage extends StatelessWidget {
  void _signOut(context) async {
    try {
      Auth auth = Provider.of(context).baseAuth;
      await auth.signOut();
      GoogleSignIn().signOut();

      if (Navigator.of(context).canPop()) {
      Navigator.pop(context);
      } 
      else {
       Navigator.of(context).pushNamed('authPage');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 15.5,
          title: Text('Home Page'),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                _signOut(context);
              },
              child: Text('Sign Out'),
            )
          ],
        ),
        body: Container(
          child: Center(
            child: Text('Welcome'),
          ),
        ),
      ),
    );
  }
}
