import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:flutter/services.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import '../pages/home_page.dart';
import '../base_auth/provider.dart';
import '../widgets/divider.dart';
import '../widgets/all_text_fields.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  static final GlobalKey<FormState> _formKeyState = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool _validateUser() {
    final form = _formKeyState.currentState;

    form.save();

    if (form.validate()) {
      form.save();
      return true;
    } else
      return false;
  }

  void _submit() async {
    if (_validateUser()) {
      try {
        final auth = Provider.of(context).baseAuth;

        String userId = await auth.signInWithEmailAndPassword(
          emailController.text,
          passwordController.text,
        );

        print('Signed in $userId');

        // Go To Home Page
        Navigator.of(context).pushNamed('homePage');
      } on PlatformException {
        Toast.show("Wrong user name or password", context,
            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      } catch (exception) {
        print(exception.toString());
      }
    }
  }

  void _registerAccount() async {
    try {
      final auth = Provider.of(context).baseAuth;
      String userId = await auth.createUserWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );

      Toast.show("You are now ready to log in!", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      print('Registered as $userId');
    } on PlatformException {
      Toast.show("User already exist", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    } catch (exception) {
      print(exception.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.cyan[700],
          height: 55,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _submit,
        child: Icon(Icons.arrow_forward),
      ),
      backgroundColor: Colors.cyan[200],
      body: Container(
        margin: EdgeInsets.only(
          top: _screenHeight * 0.10,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 150,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('assets/logo.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              // Sign in With Email and Password
              Form(
                key: _formKeyState,
                child: Column(
                  children: <Widget>[
                    EmailField(emailController),
                    PasswordField(passwordController),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Don\'t have an account?'),
                  FlatButton(
                    onPressed: _registerAccount,
                    child: Text('Click here'),
                  ),
                ],
              ),
              // End Form

              // Divider
              MyDivider(),

              // Facebook and Google buttons
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SignInButton(
                    Buttons.Facebook,
                    text: 'Continue with Facebook',
                    onPressed: () {},
                  ),
                  SignInButton(
                    Buttons.Google,
                    text: 'Continue with Google',
                    onPressed: () async {
                      try {
                        final auth = Provider.of(context).baseAuth;
                        final userId = await auth.signInWithGoogle();
                        print('Signed in with Google $userId');

                        // Go To Home Page
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => HomePage()));
                      } catch (exception) {
                        print(exception.toString());
                      }
                    },
                  ),
                ],
              ),
              // End Social Buttons
              
            ],
          ),
        ),
      ),
    );
  }
}
