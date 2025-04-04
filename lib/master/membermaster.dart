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
    {"code": "201", "name": "Baramati"},
    {"code": "202", "name": "Indapur"},
    {"code": "203", "name": "Haveli"},
  ];

  int? selectedTalukaCode;

  final List<Map<String, String>> districtList = [
    {"code": "101", "name": "Pune"},
    {"code": "102", "name": "Mumbai"},
    {"code": "103", "name": "Nagpur"},
    {"code": "104", "name": "Nashik"},
  ];
  int? selectedDistrictCode;

  final List<Map<String, String>> villageList = [
    {"code": "401", "name": "Baramati"},
    {"code": "402", "name": "Loni Kalbhor"},
    {"code": "403", "name": "Jejuri"},
  ];

  int? selectedVillageCode;

  final List<Map<String, String>> rootList = [
    {"code": "301", "name": "Route 1"},
    {"code": "302", "name": "Route 2"},
    {"code": "303", "name": "Route 3"},
  ];
  int? selectedRootCode;

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
                  SizedBox(
                    width: 200,
                    child: DropdownButtonFormField<int>(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Root Name',
                        focusColor: Colors.blue,
                      ),
                      value: selectedRootCode,
                      onChanged: (int? newValue) {
                        setState(() {
                          selectedRootCode = newValue;
                        });
                        print("Selected Root Code: $newValue");
                      },
                      items: rootList.map((root) {
                        return DropdownMenuItem<int>(
                          value:
                              int.tryParse(root['code'] ?? ""), // ⬅️ int value
                          child: Text(
                              root['name'] ?? ""), // ⬅️ only name displayed
                        );
                      }).toList(),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Radio Buttons
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 10),
                      Row(
                        children: [
                          Radio<String>(
                            value: 'B',
                            groupValue: selectedOption,
                            onChanged: (String? value) {
                              setState(() {
                                selectedOption = value!;
                              });
                            },
                          ),
                          Text(
                            "Buffalo",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      Row(
                        children: [
                          Radio<String>(
                            value: 'C',
                            groupValue: selectedOption,
                            onChanged: (String? value) {
                              setState(() {
                                selectedOption = value!;
                              });
                            },
                          ),
                          Text(
                            "Cow",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      Row(
                        children: [
                          Radio<String>(
                            value: 'CB',
                            groupValue: selectedOption,
                            onChanged: (String? value) {
                              setState(() {
                                selectedOption = value!;
                              });
                            },
                          ),
                          Text(
                            "Buffalo & Cow",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  SizedBox(
                    height: 60,
                    width: 360,
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
                        width: 360,
                        child: TextFielDesign(
                          lbltext: 'Address',
                          textEditingController: addressController,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          textInputType: TextInputType.text,
                          focusNode: addressFocus,
                          onSubmitted: (value) {
                            FocusScope.of(context).requestFocus(pinCodeFocus);
                          },
                        ),
                      ),
                      SizedBox(width: 15),
                      SizedBox(
                        height: 60,
                        width: 260,
                        child: TextFielDesign(
                          lbltext: 'Account Number',
                          textEditingController: accountnumberController,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          textInputType: TextInputType.text,
                          focusNode: accountNumberFocus,
                          onSubmitted: (value) {
                            FocusScope.of(context).requestFocus(bankNameFocus);
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
                        child: DropdownButtonFormField<int>(
                          value: selectedVillageCode,
                          decoration: InputDecoration(
                            labelText: 'Village/City',
                            border: OutlineInputBorder(),
                          ),
                          items: villageList.map((village) {
                            return DropdownMenuItem<int>(
                              value: int.tryParse(
                                  village['code'] ?? ""), // ⬅️ Value is int
                              child: Text(
                                  village['name'] ?? ""), // ⬅️ Display is name
                            );
                          }).toList(),
                          onChanged: (int? newValue) {
                            setState(() {
                              selectedVillageCode = newValue;
                            });
                            print("Selected Village Code: $newValue");
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 60,
                        width: 150,
                        child: TextFielDesign(
                          lbltext: 'Cow Dep',
                          textEditingController: cowdepositController,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          textInputType: TextInputType.text,
                          focusNode: cowDepositFocus,
                          onSubmitted: (value) {
                            FocusScope.of(context)
                                .requestFocus(buffaloDepositFocus);
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 60,
                        width: 260,
                        child: TextFielDesign(
                          lbltext: 'Bank Name',
                          textEditingController: banknameController,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          textInputType: TextInputType.text,
                          focusNode: bankNameFocus,
                          onSubmitted: (value) {
                            FocusScope.of(context).requestFocus(branchFocus);
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
                                .requestFocus(phoneNumberFocus);
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 60,
                        width: 150,
                        child: TextFielDesign(
                          lbltext: 'Buf Dep',
                          textEditingController: buffalodepositController,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          textInputType: TextInputType.text,
                          focusNode: buffaloDepositFocus,
                          onSubmitted: (value) {
                            FocusScope.of(context)
                                .requestFocus(cowCommissionFocus);
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 60,
                        width: 260,
                        child: TextFielDesign(
                          lbltext: 'Branch',
                          textEditingController: branchController,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          textInputType: TextInputType.text,
                          focusNode: branchFocus,
                          onSubmitted: (value) {
                            FocusScope.of(context).requestFocus(ifscFocus);
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
                          prefixIcon: Icons.phone,
                          onSubmitted: (value) {
                            FocusScope.of(context).requestFocus(mobileFocus);
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 60,
                        width: 150,
                        child: TextFielDesign(
                          lbltext: 'Cow Comm',
                          textEditingController: cowcommitionController,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          textInputType: TextInputType.text,
                          focusNode: cowCommissionFocus,
                          onSubmitted: (value) {
                            FocusScope.of(context)
                                .requestFocus(buffaloCommissionFocus);
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 60,
                        width: 260,
                        child: TextFielDesign(
                          lbltext: 'IFSC Code',
                          textEditingController: ifsccodeController,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          textInputType: TextInputType.text,
                          focusNode: ifscFocus,
                          onSubmitted: (value) {
                            FocusScope.of(context).requestFocus(fssaiFocus);
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
                          prefixIcon: Icons.mobile_friendly,
                          focusNode: mobileFocus,
                          onSubmitted: (value) {
                            FocusScope.of(context).requestFocus(taxNameFocus);
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 60,
                        width: 150,
                        child: TextFielDesign(
                          lbltext: 'Buf Comm',
                          textEditingController: buffalocommitionController,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          textInputType: TextInputType.text,
                          focusNode: buffaloCommissionFocus,
                          onSubmitted: (value) {
                            FocusScope.of(context)
                                .requestFocus(fixedDepositFocus);
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 60,
                        width: 260,
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
                                .requestFocus(advanceReduceFocus);
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
                        child: DropdownButtonFormField<int>(
                          value: selectedTalukaCode,
                          decoration: InputDecoration(
                            labelText: 'Taluka',
                            border: OutlineInputBorder(),
                          ),
                          items: talukaList.map((taluka) {
                            return DropdownMenuItem<int>(
                              value: int.tryParse(
                                  taluka['code'] ?? ""), // value = int
                              child:
                                  Text(taluka['name'] ?? ""), // display = name
                            );
                          }).toList(),
                          onChanged: (int? newValue) {
                            setState(() {
                              selectedTalukaCode = newValue;
                            });
                            print("Selected Taluka Code: $newValue");
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 60,
                        width: 150,
                        child: TextFielDesign(
                          lbltext: 'Fixed dep',
                          textEditingController: fixeddepositController,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          textInputType: TextInputType.text,
                          focusNode: fixedDepositFocus,
                          onSubmitted: (value) {
                            FocusScope.of(context)
                                .requestFocus(accountNumberFocus);
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 60,
                        width: 150,
                        child: TextFielDesign(
                          lbltext: 'Advance Less',
                          textEditingController: advancereduceController,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.text,
                          focusNode: advanceReduceFocus,
                          onSubmitted: (value) {
                            FocusScope.of(context).unfocus();
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 200,
                    child: DropdownButtonFormField<int>(
                      decoration: InputDecoration(
                        labelText: 'District',
                        border: OutlineInputBorder(),
                      ),
                      value: selectedDistrictCode,
                      onChanged: (int? newValue) {
                        setState(() {
                          selectedDistrictCode = newValue;
                        });
                        print("Selected District Code: $newValue");
                      },
                      items: districtList.map((district) {
                        return DropdownMenuItem<int>(
                          value: int.tryParse(district["code"] ?? ""),
                          child: Text(district["name"] ?? ""),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 10),
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
                        FocusScope.of(context).requestFocus(cowDepositFocus);
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
