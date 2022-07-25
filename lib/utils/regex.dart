class RegexTypes {
  static RegExp upperCaseValidator = RegExp(r'[A-Z]');
  static RegExp hasSymbol = RegExp(r'[!@#<>?.":_`~;[\]\\|=+)(*&^%0-9-]');
  static RegExp emailValidator = RegExp(
      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])+");
}
