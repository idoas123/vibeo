import 'package:flutter/material.dart';
import '../commons/validators.dart';
import './base_text_field.dart';

class EmailField extends StatelessWidget {
  final TextEditingController emailController;

  EmailField(this.emailController);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(10),
      child: BaseTextField(
        controller: this.emailController,
        labelText: 'Email address',
        maxCharacters: null,
        inputType: TextInputType.emailAddress,
        validator: EmailValidator.validate,
      ),
    );
  }
}

class PasswordField extends StatelessWidget {
  final TextEditingController passwordController;

  PasswordField(this.passwordController);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(10),
      child: BaseTextField(
        controller: passwordController,
        labelText: 'Password',
        maxCharacters: null,
        inputType: TextInputType.emailAddress,
        validator: PasswordValidator.validate,
      ),
    );
  }
}
