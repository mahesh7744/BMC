import 'package:bmc/other/globaldata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  final Widget? suffixIcon; // ✅ Changed to Widget? to allow IconButton
  final String? prefixText;
  final bool isEnabled;
  final bool isReadOnly;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText; // ✅ Moved out of constructor params properly

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
    this.focusNode,
    this.inputFormatters,
    this.obscureText = false, // ✅ Default false
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      controller: textEditingController,
      keyboardType: textInputType,
      inputFormatters: inputFormatters,
      textAlign: textAlign,
      obscureText: obscureText,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: '${GlobalData.fontname}',
        color: isEnabled ? Colors.black : Colors.grey,
      ),
      enabled: isEnabled,
      readOnly: isReadOnly,
      decoration: InputDecoration(
        labelText: lbltext,
        labelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          fontFamily: '${GlobalData.fontname}',
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
        ),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: suffixIcon,
        prefixText: prefixText,
      ),
      onSubmitted: onSubmitted,
      onChanged: onChanged,
    );
  }
}
