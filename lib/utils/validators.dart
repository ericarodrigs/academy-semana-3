import 'package:raro_buddy_group_4/home/home_page.dart';
import 'package:raro_buddy_group_4/utils/date_utilities.dart';
import 'package:raro_buddy_group_4/utils/regex.dart';

class Validators extends RegexTypes {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Opa, voce precisa digitar o seu nome!';
    }
    if (!value.contains('  ') &&
        !RegexTypes.hasSymbol.hasMatch(value) &&
        !RegexTypes.hasNumber.hasMatch(value)) {
      // print(valu
      final List<String> isUpper = value.split(' ');
      for (int i = 0; i < isUpper.length; i++) {
        if (!RegexTypes.upperCaseValidator.hasMatch(isUpper[i][0])) {
          return 'Opa, a palavra "${isUpper[i]}" deve começar com letra maiuscula';
        }
      }
    } else {
      return 'Ei, espaços consecutivos, símbolos e números não são permitidos';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ou, o campo de email não pode ser vazio';
    }
    if (!RegexTypes.emailValidator.hasMatch(value) ||
        value.contains(' ') ||
        RegexTypes.upperCaseValidator.hasMatch(value)) {
      return 'Cara, digita um email válido';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Digita sua Senha, sem ela nao tem como entrar';
    }
    if (value.length < 8) {
      return 'A senha deve conter no mínimo 8 caracteres';
    }
    if (!RegexTypes.uppercaseAndLowercaseValidator.hasMatch(value)) {
      return 'A senha deve ter letras minúsculas e maiúsculas';
    }
    if (!RegexTypes.hasNumber.hasMatch(value)) {
      return 'A senha deve ter pelo menos 1 número';
    }
    if (!RegexTypes.hasSymbol.hasMatch(value)) {
      return 'A senha deve ter pelo menos 1 caractere especial';
    }
    return null;
  }

  static String? confirmatePassword(String? value, String? currentPassword) {
    if (value != currentPassword) {
      return 'As senhas não condizem';
    }
    return null;
  }

  static String? validateCPF(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  static String? validateBirthdate(String? value) {
    final DateTime dateDeleted = DateTime(1920, 01, 01);

    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }

    final DateTime date = converterToDate(value: value);

    if (date.compareTo(dateDeleted) < 0) {
      return 'A data não pode ser anterior a 01/01/1920';
    }

    if (!validateDate(value)) {
      return 'Data inválida';
    }

    return null;
  }

  static String? validateGroup(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  static String? validateGender(GenderIdentity? value) {
    if (value == GenderIdentity.vazio) {
      return 'Campo obrigatório';
    }
    return null;
  }

  static String? validateTerms(bool? value) {
    if (value != null && !value) {
      return 'Campo obrigatório';
    }
    return null;
  }
}
