import 'package:flutter/material.dart';

class TextFielDesign extends StatelessWidget {
  final String lbltext;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextInputType textInputType;
  final TextEditingController? textEditingController;
  final Function(String)? onSubmitted;
  final Function(String)? onChanged;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? prefixText;
  final bool isEnabled;
  final bool isReadOnly;
  final FocusNode? focusNode; // Fixed the focus node naming issue

  const TextFielDesign({
    super.key,
    required this.lbltext,
    required this.fontSize,
    required this.fontWeight,
    required this.textAlign,
    required this.textInputType,
    this.textEditingController,
    this.onSubmitted,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixText,
    this.isEnabled = true,
    this.isReadOnly = false,
    this.focusNode, // Corrected the parameter name
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode, // Use only the correct focus node
      controller: textEditingController,
      keyboardType: textInputType,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: 'Roboto',
        color: isEnabled ? Colors.black : Colors.grey,
      ),
      enabled: isEnabled,
      readOnly: isReadOnly,
      decoration: InputDecoration(
        labelText: lbltext,
        labelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          fontFamily: 'Roboto',
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
      onSubmitted: onSubmitted,
      onChanged: onChanged,
    );
  }
}
