import 'package:beyond_the_stars/core/constants/text_styles.dart';
import 'package:flutter/material.dart';

class CustomAuthField extends StatefulWidget {
  const CustomAuthField({
    super.key,
    this.isSecureNeeded = false,
    required this.hint,
    required this.icon,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    // required this.controller,
  });
  //final TextEditingController? controller;
  final String? Function(String?)? validator;
  final IconData icon;
  final String hint;
  final bool isSecureNeeded;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  @override
  State<CustomAuthField> createState() => _CustomAuthFieldState();
}

class _CustomAuthFieldState extends State<CustomAuthField> {
  bool isSecure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //  controller: ,
      validator: widget.validator,
      style: TextStyle(color: Colors.blue[900], fontWeight: FontWeight.bold),
      obscureText: !widget.isSecureNeeded
          ? false
          : isSecure
              ? true
              : false,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
          errorStyle: AppTextStyles.textFieldErrorStyle,
          filled: true,
          fillColor: Colors.white,
          hintText: widget.hint,
          hintStyle: const TextStyle(color: Color(0xff1D97ED)),
          suffixIcon: widget.isSecureNeeded
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isSecure = !isSecure;
                    });
                  },
                  icon: Icon(
                    isSecure ? Icons.visibility : Icons.visibility_off,
                    color: const Color(0xff1D97ED),
                  ))
              : Icon(
                  widget.icon,
                  color: const Color(0xff1D97ED),
                ),
          enabledBorder: buildBorder(),
          border: buildBorder(),
          errorBorder: buildBorder(),
          focusedBorder: buildBorder()),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Color(0xff1D97ED), width: 1.5));
  }
}
