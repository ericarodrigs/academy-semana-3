class RegexTypes {
  static RegExp upperCaseValidator = RegExp(r'[A-Z]');

  static RegExp hasSymbol = RegExp(r'[!@#<>$?.":_`~;[\]\\/{}|=+)(*&^%-]');

  static RegExp emailValidator = RegExp(
      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])+");

  static RegExp uppercaseAndLowercaseValidator =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])');

  static RegExp hasNumber = RegExp(r'^(?=.*?[0-9])');
}
