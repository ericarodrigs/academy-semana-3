class Validators {
  Validators();
  /* TODO: Nome
RN01: o campo não pode ser vazio
RN02: o campo não pode ter mais de 1 espaço entre as palavras
RN03: ao digitar, a primeira letra de cada palavra deve ser maiúscula
RN04: abreviações com ponto não devem ser aceitas */

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Opa, voce precisa digitar o seu nome!';
    }
    return null;
    //String variavel = r'(^[a-zA-Z ]*$)';
  }
}
