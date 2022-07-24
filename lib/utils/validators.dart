class Validators {
  Validators();
  // ignore: todo
  /* TODO: Nome
RN01: o campo não pode ser vazio
RN02: o campo não pode ter mais de 1 espaço entre as palavras
RN03: ao digitar, a primeira letra de cada palavra deve ser maiúscula
RN04: abreviações com ponto não devem ser aceitas */

  static String? validateName(String? value) {
    RegExp upperCaseValidator = RegExp(r'[A-Z]');
    RegExp hasSymbol = RegExp(r'[!@#<>?.":_`~;[\]\\|=+)(*&^%0-9-]');
    if (value == null || value.isEmpty) {
      return 'Opa, voce precisa digitar o seu nome!';
    } else if (!value.contains('  ') && !hasSymbol.hasMatch(value)) {
      // print(valu
      final List<String> isUpper = value.split(' ');
      for (int i = 0; i < isUpper.length; i++) {
        if (!upperCaseValidator.hasMatch(isUpper[i][0])) {
          return 'Opa, a palavra "${isUpper[i]}" deve começar com letra maiuscula';
        }
      }
    } else {
      return 'Ei, espaços concecutivos e símbolos não são permitidos';
    }
    return null;
  }
}
