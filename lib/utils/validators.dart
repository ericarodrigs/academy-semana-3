import 'package:raro_buddy_group_4/utils/regex.dart';

class Validators extends RegexTypes {
  Validators();
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Opa, voce precisa digitar o seu nome!';
    } else if (!value.contains('  ') && !RegexTypes.hasSymbol.hasMatch(value)) {
      // print(valu
      final List<String> isUpper = value.split(' ');
      for (int i = 0; i < isUpper.length; i++) {
        if (!RegexTypes.upperCaseValidator.hasMatch(isUpper[i][0])) {
          return 'Opa, a palavra "${isUpper[i]}" deve começar com letra maiuscula';
        }
      }
    } else {
      return 'Ei, espaços concecutivos e símbolos não são permitidos';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ou, o campo de email não pode ser vazio';
    } else if (!RegexTypes.emailValidator.hasMatch(value) ||
        value.contains(' ') ||
        RegexTypes.upperCaseValidator.hasMatch(value)) {
      return 'Cara, digita um email válido';
    }
    return null;
  }
}
