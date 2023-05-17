import 'package:get/get.dart';

String? emailValidator(String? email) {
  if (email == null || email.isEmpty) {
    return 'Email is required';
  }

  if (!email.isEmail) {
    return 'Invalid email';
  }

  return null;
}

String? passwordValidator(String? password) {
  if (password == null || password.isEmpty) {
    return 'Password is required';
  }

  if (password.length < 7) {
    return 'Password must have at least 7 characters';
  }

  return null;
}

String? nameValidator(String? name) {
  if (name == null || name.isEmpty) {
    return 'Name is required';
  }

  final splittedName = name.split(' ');
  if (splittedName.length == 1) {
    return 'Please enter your fullname';
  }

  return null;
}

String? phoneValidator(String? phone) {
  if (phone == null || phone.isEmpty) {
    return 'Phone is required';
  }

  if (!phone.isPhoneNumber || phone.length < 14) {
    return 'Please enter a valid phone number';
  }

  return null;
}

String? cpfValidator(String? cpf) {
  if (cpf == null || cpf.isEmpty) {
    return 'CPF is required';
  }

  if (!cpf.isCpf) {
    return 'Please enter a valid CPF';
  }

  return null;
}
