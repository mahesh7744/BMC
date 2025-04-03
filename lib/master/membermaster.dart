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
  TextEditingController societycodeController = TextEditingController();
  TextEditingController societynameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController accountnumberController = TextEditingController();
  TextEditingController cowdepositController = TextEditingController();
  TextEditingController banknameController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController buffalodepositController = TextEditingController();
  TextEditingController branchController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController cowcommitionController = TextEditingController();
  TextEditingController ifsccodeController = TextEditingController();
  TextEditingController mobilenumberController = TextEditingController();
  TextEditingController buffalocommitionController = TextEditingController();
  TextEditingController fssaiController = TextEditingController();
  TextEditingController fixeddepositController = TextEditingController();
  TextEditingController advancereduceController = TextEditingController();
  TextEditingController taxnameController = TextEditingController();

  final List<Map<String, String>> talukaList = [
    {"code": "1", "name": "Pune"},
    {"code": "2", "name": "Mumbai"},
    {"code": "3", "name": "Nagpur"},
    {"code": "4", "name": "Nashik"},
  ];
  Map<String, String>? selectedTaluka;

  final List<Map<String, String>> districtList = [
    {"code": "101", "name": "Pune"},
    {"code": "102", "name": "Mumbai"},
    {"code": "103", "name": "Nagpur"},
    {"code": "104", "name": "Nashik"},
  ];
  Map<String, String>? selectedDistrict;

  final List<Map<String, String>> villageList = [
    {"code": "201", "name": "Ichalkaranji"},
    {"code": "202", "name": "Kolhapur"},
    {"code": "203", "name": "Sangli"},
    {"code": "204", "name": "Satara"},
  ];
  Map<String, String>? selectedVillage;

  final List<Map<String, String>> rootList = [
    {"code": "101", "name": "Pune"},
    {"code": "102", "name": "Mumbai"},
    {"code": "103", "name": "Nagpur"},
    {"code": "104", "name": "Nashik"},
  ];
  Map<String, String>? selectedRoot;

  bool isChecked = false;
  String selectedOption = 'Option 1';

  FocusNode societyCodeFocus = FocusNode();
  FocusNode societyNameFocus = FocusNode();
  FocusNode addressFocus = FocusNode();
  FocusNode accountNumberFocus = FocusNode();
  final FocusNode villageFocus = FocusNode();
  final FocusNode cowDepositFocus = FocusNode();
  final FocusNode bankNameFocus = FocusNode();
  final FocusNode pinCodeFocus = FocusNode();
  final FocusNode buffaloDepositFocus = FocusNode();
  final FocusNode branchFocus = FocusNode();
  final FocusNode phoneNumberFocus = FocusNode();
  final FocusNode cowCommissionFocus = FocusNode();
  final FocusNode ifscFocus = FocusNode();
  final FocusNode mobileFocus = FocusNode();
  final FocusNode buffaloCommissionFocus = FocusNode();
  final FocusNode fssaiFocus = FocusNode();
  final FocusNode fixedDepositFocus = FocusNode();
  final FocusNode advanceReduceFocus = FocusNode();
  final FocusNode taxNameFocus = FocusNode();

  @override
  void dispose() {
    // FocusNode dispose करणे आवश्यक आहे
    societyCodeFocus.dispose();
    societyNameFocus.dispose();
    addressFocus.dispose();
    accountNumberFocus.dispose();
    villageFocus.dispose();
    cowDepositFocus.dispose();
    bankNameFocus.dispose();
    pinCodeFocus.dispose();
    buffaloDepositFocus.dispose();
    branchFocus.dispose();
    phoneNumberFocus.dispose();
    cowCommissionFocus.dispose();
    ifscFocus.dispose();
    mobileFocus.dispose();
    buffaloCommissionFocus.dispose();
    fssaiFocus.dispose();
    fixedDepositFocus.dispose();
    advanceReduceFocus.dispose();
    taxNameFocus.dispose();
    super.dispose();
  }

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
                      lbltext: 'Society Code',
                      textEditingController: societycodeController,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.left,
                      textInputType: TextInputType.text,
                      focusNode: societyCodeFocus,
                      onSubmitted: (value) {
                        FocusScope.of(context).requestFocus(societyNameFocus);
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<Map<String, String>>(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Root Name',
                      focusColor: Colors.blue,
                    ),
                    value: selectedRoot,
                    onChanged: (Map<String, String>? newValue) {
                      setState(() {
                        selectedRoot = newValue;
                      });
                      print(
                          "Selected Root Name: ${newValue?['code']} - ${newValue?['name']}");
                    },
                    items: rootList.map((root) {
                      return DropdownMenuItem(
                        value: root,
                        child: Text("${root['code']} - ${root['name']}"),
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
                    width: 410,
                    child: TextFielDesign(
                      lbltext: 'Society Name',
                      textEditingController: societynameController,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.left,
                      textInputType: TextInputType.text,
                      focusNode: societyNameFocus,
                      onSubmitted: (value) {
                        FocusScope.of(context).requestFocus(addressFocus);
                      },
                    ),
                  ),
                  SizedBox(width: 15),

                  const SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(
                        height: 60,
                        width: 410,
                        child: TextFielDesign(
                          lbltext: 'Address',
                          textEditingController: addressController,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          textInputType: TextInputType.text,
                          focusNode: addressFocus,
                          onSubmitted: (value) {
                            FocusScope.of(context)
                                .requestFocus(accountNumberFocus);
                          },
                        ),
                      ),
                      SizedBox(width: 15),
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: TextFielDesign(
                          lbltext: 'Account Number',
                          textEditingController: accountnumberController,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          textInputType: TextInputType.text,
                          focusNode: accountNumberFocus,
                          onSubmitted: (value) {
                            FocusScope.of(context)
                                .requestFocus(cowDepositFocus);
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: DropdownButtonFormField<Map<String, String>>(
                          value: selectedVillage, // Selected Value
                          decoration: InputDecoration(
                            labelText: 'Village/City',
                            border: OutlineInputBorder(),
                          ),
                          items: villageList.map((village) {
                            return DropdownMenuItem(
                              value: village,
                              child: Text(
                                  "${village['code']} - ${village['name']}"),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              selectedVillage = newValue;
                            });
                            print(
                                "Selected Village/City: ${newValue?['code']} - ${newValue?['name']}");
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: TextFielDesign(
                          lbltext: 'Cow deposit Rs',
                          textEditingController: cowdepositController,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          textInputType: TextInputType.text,
                          focusNode: cowDepositFocus,
                          onSubmitted: (value) {
                            FocusScope.of(context).requestFocus(bankNameFocus);
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: TextFielDesign(
                          lbltext: 'Bank Name',
                          textEditingController: banknameController,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          textInputType: TextInputType.text,
                          focusNode: bankNameFocus,
                          onSubmitted: (value) {
                            FocusScope.of(context).requestFocus(pinCodeFocus);
                          },
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
                          textEditingController: pincodeController,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          textInputType: TextInputType.text,
                          focusNode: pinCodeFocus,
                          onSubmitted: (value) {
                            FocusScope.of(context)
                                .requestFocus(buffaloDepositFocus);
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: TextFielDesign(
                          lbltext: 'Buffalo deposit Rs',
                          textEditingController: buffalodepositController,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          textInputType: TextInputType.text,
                          focusNode: buffaloDepositFocus,
                          onSubmitted: (value) {
                            FocusScope.of(context).requestFocus(branchFocus);
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: TextFielDesign(
                          lbltext: 'Branch',
                          textEditingController: branchController,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          textInputType: TextInputType.text,
                          focusNode: branchFocus,
                          onSubmitted: (value) {
                            FocusScope.of(context)
                                .requestFocus(phoneNumberFocus);
                          },
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
                          textEditingController: phonenumberController,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          textInputType: TextInputType.text,
                          focusNode: phoneNumberFocus,
                          onSubmitted: (value) {
                            FocusScope.of(context)
                                .requestFocus(cowCommissionFocus);
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: TextFielDesign(
                          lbltext: 'Cow Commition Rs',
                          textEditingController: cowcommitionController,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          textInputType: TextInputType.text,
                          focusNode: cowCommissionFocus,
                          onSubmitted: (value) {
                            FocusScope.of(context).requestFocus(ifscFocus);
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: TextFielDesign(
                          lbltext: 'IFSC Code',
                          textEditingController: ifsccodeController,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          textInputType: TextInputType.text,
                          focusNode: ifscFocus,
                          onSubmitted: (value) {
                            FocusScope.of(context).requestFocus(mobileFocus);
                          },
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
                          textEditingController: mobilenumberController,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          textInputType: TextInputType.text,
                          focusNode: mobileFocus,
                          onSubmitted: (value) {
                            FocusScope.of(context)
                                .requestFocus(buffaloCommissionFocus);
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: TextFielDesign(
                          lbltext: 'Buffalo Commition Rs',
                          textEditingController: buffalocommitionController,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          textInputType: TextInputType.text,
                          focusNode: buffaloCommissionFocus,
                          onSubmitted: (value) {
                            FocusScope.of(context).requestFocus(fssaiFocus);
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: TextFielDesign(
                          lbltext: 'Fssai Number',
                          textEditingController: fssaiController,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          textInputType: TextInputType.text,
                          focusNode: fssaiFocus,
                          onSubmitted: (value) {
                            FocusScope.of(context)
                                .requestFocus(fixedDepositFocus);
                          },
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
                        child: DropdownButtonFormField<Map<String, String>>(
                          value: selectedTaluka,
                          decoration: InputDecoration(
                            labelText: 'Taluka',
                            border: OutlineInputBorder(),
                          ),
                          items: talukaList.map((taluka) {
                            return DropdownMenuItem(
                              value: taluka,
                              child:
                                  Text("${taluka['code']} - ${taluka['name']}"),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              selectedTaluka = newValue;
                            });
                            print(
                                "Selected Taluka: ${newValue?['code']} - ${newValue?['name']}");
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: TextFielDesign(
                          lbltext: 'Fixed deposit Rs',
                          textEditingController: fixeddepositController,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          textInputType: TextInputType.text,
                          focusNode: fixedDepositFocus,
                          onSubmitted: (value) {
                            FocusScope.of(context)
                                .requestFocus(advanceReduceFocus);
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: TextFielDesign(
                          lbltext: 'Advance Reduce',
                          textEditingController: advancereduceController,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          textInputType: TextInputType.text,
                          focusNode: advanceReduceFocus,
                          onSubmitted: (value) {
                            FocusScope.of(context).requestFocus(taxNameFocus);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 60,
                    width: 200,
                    child: DropdownButtonFormField<Map<String, String>>(
                      value: selectedDistrict,
                      decoration: InputDecoration(
                        labelText: 'District',
                        border: OutlineInputBorder(),
                      ),
                      items: districtList.map((district) {
                        return DropdownMenuItem(
                          value: district,
                          child:
                              Text("${district['code']} - ${district['name']}"),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedDistrict = newValue;
                        });
                        print(
                            "Selected District: ${newValue?['code']} - ${newValue?['name']}");
                      },
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    width: 200,
                    child: TextFielDesign(
                      lbltext: 'Tax Name',
                      textEditingController: taxnameController,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.left,
                      textInputType: TextInputType.text,
                      focusNode: taxNameFocus,
                      onSubmitted: (value) {
                        FocusScope.of(context).unfocus();
                      },
                    ),
                  ),
                  CheckboxListTile(
                    title: Text("ON/OFF", style: TextStyle(fontSize: 16)),
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
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
