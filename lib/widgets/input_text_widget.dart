import 'package:flutter/material.dart';

class InputTextWidget extends StatelessWidget {
  const InputTextWidget({
    Key? key,
    required this.labelText,
    this.textInputAction,
    this.onChanged,
    this.validator,
    this.obscureText,
    this.togglePasswordView,
  }) : super(key: key);

  final String labelText;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final VoidCallback? togglePasswordView;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: TextFormField(
        textInputAction: textInputAction ?? TextInputAction.done,
        validator: validator,
        onChanged: onChanged,
        obscureText: obscureText ?? false,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.black),
          suffixIcon: togglePasswordView != null
              ? IconButton(
                  icon: Icon(
                    obscureText! ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: togglePasswordView,
                )
              : null,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1),
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 1.5),
          ),
        ),
      ),
    );
  }
}
