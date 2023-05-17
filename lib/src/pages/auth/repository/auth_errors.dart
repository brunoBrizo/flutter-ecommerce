String authErrorsString(String? code) {
  switch (code) {
    case 'INVALID_CREDENTIALS':
      return 'Invalid credentials';
    case 'Invalid session token':
      return 'Invalid session token';
    case 'INVALID_FULLNAME':
      return 'Invalid fullname';
    case 'INVALID_PHONE':
      return 'Invalid phone number';
    case 'INVALID_CPF':
      return 'Invalid CPF';
    default:
      return 'Unknown error';
  }
}
