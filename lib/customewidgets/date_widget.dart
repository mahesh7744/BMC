import 'package:bmc/customewidgets/date_utility.dart';
import 'package:bmc/other/globaldata.dart';

import 'package:flutter/material.dart';

class DatePickerField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final Function(DateTime)? onDateChanged;

  const DatePickerField({
    required this.controller,
    required this.labelText,
    this.onDateChanged,
    Key? key,
  }) : super(key: key);

  @override
  _DatePickerFieldState createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    widget.controller.text = DateUtils_widget.formatDate(_selectedDate);
  }

  void _pickDate() async {
    final DateTime? pickedDate =
        await DateUtils_widget.selectDate(context, _selectedDate);
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        widget.controller.text = DateUtils_widget.formatDate(_selectedDate);
      });
      if (widget.onDateChanged != null) {
        widget.onDateChanged!(_selectedDate);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        fontFamily: GlobalData.fontname,
      ),
      controller: widget.controller,
      readOnly: true,
      onTap: _pickDate,
      decoration: InputDecoration(
        labelText: widget.labelText, // डायनामिक Label वापरा
        labelStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: GlobalData.fontname,
        ),
        suffixIcon: const Icon(
          Icons.calendar_today,
          size: 25,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
