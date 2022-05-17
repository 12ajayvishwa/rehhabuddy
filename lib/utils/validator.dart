import 'package:intl/intl.dart';

String? nameValidator(value) {
  RegExp regex = RegExp(r'^.{3,}$');
  if (value!.isEmpty) {
    return ("Please enter name");
  }
  if (!regex.hasMatch(value)) {
    return ("Enter Valid name(Min. 3 Character)");
  }
  return null;
}

String? passwordValidator(value) {
  RegExp regex = RegExp(r'^.{6,}$');
  if (value!.isEmpty) {
    return ("Password is required for login");
  }
  if (!regex.hasMatch(value)) {
    return ("Enter Valid Password(Min. 6 Character)");
  }
  return null;
}

String? emailValidator(value) {
  if (value!.isEmpty) {
    return ("Please Enter Your Email");
  }
  if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
    return ("Please Enter a valid email");
  }
  return null;
}

String? phoneNumberValidator(value) {
  RegExp regExp = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
  if (value!.length == 0) {
    return 'Please enter mobile number';
  } else if (!regExp.hasMatch(value)) {
    return 'Please enter valid mobile number';
  }
  return null;
}

var male;
var female;
var other;
String? genderValidator(value) {
  if (value!.length == 0) {
    return 'Please enter gender';
  } else if (value == male) {
    return 'Gender should be m/f/o.';
  } else if (value == female) {
    return 'Gender should be in m/f/o.';
  } else if (value == other) {
    return 'Gender should be m/f/o.';
  } else {
    return null;
  }
}
