import 'package:bmc/customewidgets/date_widget.dart';
import 'package:flutter/material.dart';
import 'package:bmc/customewidgets/custom_button.dart';
import 'package:bmc/customewidgets/custom_textfield.dart';
import 'package:bmc/other/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Milkcollection extends StatefulWidget {
  const Milkcollection({super.key});

  @override
  State<Milkcollection> createState() => _MilkcollectionState();
}

class _MilkcollectionState extends State<Milkcollection> {
  TextEditingController trscDateController = TextEditingController();
  TextEditingController trscTimeController = TextEditingController();
  TextEditingController rootcodeController = TextEditingController();
  TextEditingController rootnameController = TextEditingController();

  String selectedShift = 'Morning';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 58, 245, 226),
          size: 25,
        ),
        toolbarHeight: 40,
        backgroundColor: Colors.indigo.shade300,
        centerTitle: true,
        title: const Text(
          'Milk Collection',
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'Roboto',
            color: Color.fromARGB(255, 58, 245, 226),
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          width: 600,
          child: Column(
            children: [
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(width: 10),
                  SizedBox(
                    height: 60,
                    width: 160,
                    child: DatePickerField(
                      controller: trscDateController,
                      labelText: 'Select Date',
                    ),
                  ),
                  SizedBox(width: 20),
                  SizedBox(
                    height: 60,
                    width: 160,
                    child: TextFormField(
                      controller: trscTimeController,
                      readOnly: true,
                      onTap: () async {
                        final TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (pickedTime != null) {
                          trscTimeController.text = pickedTime.format(context);
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Time', // Select Time in Marathi
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(width: 10),
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: ListTile(
                      title: Text('Morning'),
                      leading: Radio<String>(
                        value: 'Morning',
                        groupValue: selectedShift,
                        onChanged: (value) {
                          setState(() {
                            selectedShift = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: ListTile(
                      title: Text('Evening'),
                      leading: Radio<String>(
                        value: 'Evening',
                        groupValue: selectedShift,
                        onChanged: (value) {
                          setState(() {
                            selectedShift = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(width: 10),
                  SizedBox(
                    height: 60,
                    width: 150,
                    child: TextFielDesign(
                      lbltext: 'Root code',
                      textEditingController: rootcodeController,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.left,
                      textInputType: TextInputType.text,
                      // focusNode: societyCodeFocus,
                      // onSubmitted: (value) {
                      //   FocusScope.of(context).requestFocus(rootnameFocus);
                      // },
                    ),
                  ),
                  SizedBox(width: 10),
                  SizedBox(
                    height: 60,
                    width: 400,
                    child: TextFielDesign(
                      lbltext: 'Root Name',
                      textEditingController: rootnameController,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.left,
                      textInputType: TextInputType.text,
                      // focusNode: societyCodeFocus,
                      // onSubmitted: (value) {
                      //   FocusScope.of(context).requestFocus(rootnameFocus);
                      // },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
