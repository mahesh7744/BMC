import 'package:bmc/customewidgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class Membermaster extends StatefulWidget {
  const Membermaster({super.key});

  @override
  State<Membermaster> createState() => _MembermasterState();
}

class _MembermasterState extends State<Membermaster> {
  String? selectedValue;
  List<String> dropdownItems = ['Ichalkaranji', 'Kolhapur', 'Sangli', 'Satara'];
  String selectedOption = 'Option 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent.shade100,
        centerTitle: true,
        title: const Text(
          'Member Master',
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'Roboto',
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              width: 600,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 60,
                    width: 200,
                    child: TextFielDesign(
                      lbltext: 'Member Code',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.left,
                      textInputType: TextInputType.text,
                    ),
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text(
                        'Root Name',
                        style: TextStyle(
                            fontWeight: FontWeight.bold), // Bold label
                      ),
                    ),
                    value: selectedValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue = newValue;
                      });
                    },
                    items: dropdownItems.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 10),

                  // Radio Buttons
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Milk Types:",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Radio<String>(
                            value: 'Buffalo',
                            groupValue: selectedOption,
                            onChanged: (String? value) {
                              setState(() {
                                selectedOption = value!;
                              });
                            },
                          ),
                          Text("Buffalo"),
                        ],
                      ),
                      Row(
                        children: [
                          Radio<String>(
                            value: 'Cow',
                            groupValue: selectedOption,
                            onChanged: (String? value) {
                              setState(() {
                                selectedOption = value!;
                              });
                            },
                          ),
                          Text("Cow"),
                        ],
                      ),
                      Row(
                        children: [
                          Radio<String>(
                            value: 'Buffalo & Cow',
                            groupValue: selectedOption,
                            onChanged: (String? value) {
                              setState(() {
                                selectedOption = value!;
                              });
                            },
                          ),
                          Text("Buffalo & Cow"),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  SizedBox(
                    height: 60,
                    width: 400,
                    child: TextFielDesign(
                      lbltext: 'Member Name',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.left,
                      textInputType: TextInputType.text,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
