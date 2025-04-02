import 'package:flutter/material.dart';

class TextFielDesign extends StatelessWidget {
  final String lbltext;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextInputType textInputType;
  final TextEditingController? textEditingController;
  final Function(String)? onSubmitted; // Add onSubmitted as a callback
  final Function(String)? onChanged; // Add onChanged as a callback
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? prefixText;
  final bool isEnabled;
  final bool isReadOnly;
  final FocusNode? focusnodeuse;

  const TextFielDesign({
    super.key,
    required this.lbltext,
    required this.fontSize,
    required this.fontWeight,
    required this.textAlign,
    required this.textInputType,
    this.textEditingController,
    this.onSubmitted,
    this.onChanged, // Initialize onChanged
    this.prefixIcon,
    this.suffixIcon,
    this.prefixText,
    this.isEnabled = true,
    this.focusnodeuse,
    this.isReadOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusnodeuse,
      controller: textEditingController,
      keyboardType: textInputType,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: 'MonterReg',
        color: isEnabled ? Colors.black : Colors.grey,
      ),
      enabled: isEnabled,
      readOnly: isReadOnly,
      decoration: InputDecoration(
        labelText: lbltext,
        labelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          fontFamily: 'MonterReg',
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
        ),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
        prefixText: prefixText,
      ),
      onSubmitted: onSubmitted, // Use onSubmitted callback
      onChanged: onChanged, // Use onChanged callback
    );
  }
}
