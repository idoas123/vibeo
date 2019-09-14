enum FormType {login, register}

class EmailValidator {
  static String validate(String value){

    if(value.isEmpty){
      return "Email cant be empty";
    }

    bool isEmailValid = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);

    return isEmailValid ? null : "Email is not valid";
  }
}

class PasswordValidator {
  static String validate(String value){
    return value.length < 6 ? "Password must be at least 6 characters" : null;
  }
}