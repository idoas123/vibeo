import 'package:flutter/material.dart';

class BaseTextField extends StatelessWidget {
  final String labelText;
  final int maxCharacters;
  final TextInputType inputType;
  final String Function(String) validator;
  final TextEditingController controller;

  BaseTextField(
      {this.labelText,
      this.maxCharacters,
      this.inputType,
      this.validator,
      this.controller});

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: _screenWidth * 0.82,
      child: TextFormField(
        controller: this.controller,
        decoration: InputDecoration(
          labelText: this.labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
        ),
        maxLength: this.maxCharacters,
        keyboardType: this.inputType,
        validator: this.validator,
        obscureText: this.labelText.contains('Password') ? true : false,
      ),
    );
  }
}
