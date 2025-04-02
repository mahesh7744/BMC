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
              width: 700,
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

                  Row(
                    children: [
                      SizedBox(
                        height: 60,
                        width: 410,
                        child: TextFielDesign(
                          lbltext: 'Member Name',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          textInputType: TextInputType.text,
                        ),
                      ),
                      SizedBox(width: 15),
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: TextFielDesign(
                          lbltext: 'Name In English',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          textInputType: TextInputType.text,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(
                        height: 60,
                        width: 410,
                        child: TextFielDesign(
                          lbltext: 'Address',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          textInputType: TextInputType.text,
                        ),
                      ),
                      SizedBox(width: 15),
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: TextFielDesign(
                          lbltext: 'Account Number',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          textInputType: TextInputType.text,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: TextFielDesign(
                          lbltext: 'Village/City',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          textInputType: TextInputType.text,
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: TextFielDesign(
                          lbltext: 'Cow deposit Rs',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          textInputType: TextInputType.text,
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: TextFielDesign(
                          lbltext: 'Bank Name',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          textInputType: TextInputType.text,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: TextFielDesign(
                          lbltext: 'Pin Code',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          textInputType: TextInputType.text,
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: TextFielDesign(
                          lbltext: 'Buffalo deposit Rs',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          textInputType: TextInputType.text,
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: TextFielDesign(
                          lbltext: 'Branch',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          textInputType: TextInputType.text,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: TextFielDesign(
                          lbltext: 'Phone No',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          textInputType: TextInputType.text,
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: TextFielDesign(
                          lbltext: 'Cow transport Rs',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          textInputType: TextInputType.text,
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: TextFielDesign(
                          lbltext: 'IFSC Code',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          textInputType: TextInputType.text,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: TextFielDesign(
                          lbltext: 'Mobile No',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          textInputType: TextInputType.text,
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: TextFielDesign(
                          lbltext: 'Buffalo transport Rs',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          textInputType: TextInputType.text,
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: TextFielDesign(
                          lbltext: 'Fssai Number',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          textInputType: TextInputType.text,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: TextFielDesign(
                          lbltext: 'Taluka',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          textInputType: TextInputType.text,
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: TextFielDesign(
                          lbltext: 'Fixed deposit Rs',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          textInputType: TextInputType.text,
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: TextFielDesign(
                          lbltext: 'Advance Reduce',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          textInputType: TextInputType.text,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 60,
                    width: 200,
                    child: TextFielDesign(
                      lbltext: 'District',
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
