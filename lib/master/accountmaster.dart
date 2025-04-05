import 'package:flutter/material.dart';
import 'package:bmc/customewidgets/custom_textfield.dart';
import 'package:flutter/services.dart';
import 'package:bmc/customewidgets/custom_button.dart';

class Accountmaster extends StatefulWidget {
  const Accountmaster({super.key});

  @override
  State<Accountmaster> createState() => _AccountmasterState();
}

class _AccountmasterState extends State<Accountmaster> {
  TextEditingController groupController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController accountnameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController talukaController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController mobile1Controller = TextEditingController();
  TextEditingController mobile2Controller = TextEditingController();
  TextEditingController openingbalanceController = TextEditingController();

  List<Map<String, String>> villageList = [
    {'name': 'Pune', 'code': '101'},
    {'name': 'Mumbai', 'code': '102'},
    {'name': 'Nashik', 'code': '103'},
  ];

  int? selectedVillageCode;

  List<Map<String, String>> talukaList = [
    {'code': '101', 'name': 'Pune'},
    {'code': '102', 'name': 'Baramati'},
    {'code': '103', 'name': 'Mulshi'},
  ];

  int? selectedTalukaCode;

  List<Map<String, String>> districtList = [
    {'name': 'Kolhapur', 'code': '111'},
    {'name': 'Solapur', 'code': '222'},
    {'name': 'Nagpur', 'code': '333'},
  ];

  int? selectedDistrictCode;

  List<Map<String, String>> groupList = [
    {'code': '001', 'name': 'Capital'},
    {'code': '002', 'name': 'Cash & Bank Balances'},
    {'code': '003', 'name': 'Current Assets'},
    {'code': '004', 'name': 'Direct Income'},
    {'code': '005', 'name': 'Profit & Loss'},
  ];
  int? selectedGroupCode;

  String? selectedTransactionType;

  FocusNode groupnameFocus = FocusNode();
  FocusNode codeFocus = FocusNode();
  FocusNode accountnameFocus = FocusNode();
  FocusNode addressFocus = FocusNode();
  FocusNode cityFocus = FocusNode();
  FocusNode pincodeFocus = FocusNode();
  FocusNode mobile1Focus = FocusNode();
  FocusNode openingbalanceFocus = FocusNode();
  FocusNode talukaFocus = FocusNode();
  FocusNode districtFocus = FocusNode();
  FocusNode mobile2Focus = FocusNode();
  FocusNode transactiontypeFocus = FocusNode();

  @override
  void dispose() {
    // FocusNode dispose करणे आवश्यक आहे
    groupnameFocus.dispose();
    codeFocus.dispose();
    accountnameFocus.dispose();
    addressFocus.dispose();
    cityFocus.dispose();
    pincodeFocus.dispose();
    mobile1Focus.dispose();
    openingbalanceFocus.dispose();
    talukaFocus.dispose();
    districtFocus.dispose();
    mobile2Focus.dispose();
    transactiontypeFocus.dispose();
    super.dispose();
  }

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
          'Account Master',
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'Roboto',
            color: Color.fromARGB(255, 58, 245, 226),
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 450,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  width: 360,
                  child: Autocomplete<String>(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text.isEmpty) {
                        return const Iterable<String>.empty();
                      }
                      return groupList
                          .map((e) => e['name'] ?? '')
                          .where((name) => name
                              .toLowerCase()
                              .contains(textEditingValue.text.toLowerCase()))
                          .where((name) => name.isNotEmpty)
                          .toList();
                    },
                    displayStringForOption: (String option) => option,
                    onSelected: (String selectedName) {
                      final selectedGroup = groupList.firstWhere(
                        (element) => element['name'] == selectedName,
                        orElse: () => {'code': '0'},
                      );
                      selectedGroupCode =
                          int.tryParse(selectedGroup['code'] ?? '0');
                      print(
                          "Selected Group: $selectedName, Code: $selectedGroupCode");
                    },
                    fieldViewBuilder: (BuildContext context,
                        TextEditingController textEditingController,
                        FocusNode focusNode,
                        VoidCallback onFieldSubmitted) {
                      groupController =
                          textEditingController; // optional if you're using it elsewhere
                      return TextField(
                        controller: textEditingController,
                        focusNode: focusNode, // ✅ Use this, not groupnameFocus
                        onSubmitted: (value) {
                          FocusScope.of(context).requestFocus(codeFocus);
                        },
                        decoration: const InputDecoration(
                          labelText: 'Group Name',
                          border: OutlineInputBorder(),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  width: 150,
                  child: TextFielDesign(
                    lbltext: 'Code',
                    textEditingController: codeController,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                    textInputType: TextInputType.text,
                    focusNode: codeFocus,
                    onSubmitted: (value) {
                      FocusScope.of(context).requestFocus(accountnameFocus);
                    },
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  width: 360,
                  child: TextFielDesign(
                    lbltext: 'Account Name',
                    textEditingController: accountnameController,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.left,
                    textInputType: TextInputType.text,
                    focusNode: accountnameFocus,
                    onSubmitted: (value) {
                      FocusScope.of(context).requestFocus(addressFocus);
                    },
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  width: 360,
                  child: TextFielDesign(
                    lbltext: 'Address',
                    textEditingController: addressController,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.left,
                    textInputType: TextInputType.text,
                    prefixIcon: Icons.location_on,
                    focusNode: addressFocus,
                    onSubmitted: (value) {
                      FocusScope.of(context).requestFocus(cityFocus);
                    },
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: Autocomplete<String>(
                        optionsBuilder: (TextEditingValue textEditingValue) {
                          if (textEditingValue.text.isEmpty) {
                            return const Iterable<String>.empty();
                          }
                          return villageList
                              .map((e) => e['name'] ?? '')
                              .where((name) => name.toLowerCase().contains(
                                  textEditingValue.text.toLowerCase()))
                              .where((name) => name.isNotEmpty)
                              .toList();
                        },
                        onSelected: (String selectedName) {
                          final selectedVillage = villageList.firstWhere(
                            (element) => element['name'] == selectedName,
                            orElse: () => {'code': '0'},
                          );
                          selectedVillageCode =
                              int.tryParse(selectedVillage['code'] ?? '0');
                          print(
                              "Selected Village: $selectedName, Code: $selectedVillageCode");
                        },
                        fieldViewBuilder: (BuildContext context,
                            TextEditingController textEditingController,
                            FocusNode focusNode,
                            VoidCallback onFieldSubmitted) {
                          cityController = textEditingController;
                          return TextField(
                            controller: textEditingController,
                            focusNode: focusNode, // use the correct focusNode
                            onSubmitted: (value) {
                              FocusScope.of(context).requestFocus(pincodeFocus);
                            },
                            decoration: const InputDecoration(
                              labelText: 'City',
                              border: OutlineInputBorder(),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: Autocomplete<String>(
                        optionsBuilder: (TextEditingValue textEditingValue) {
                          if (textEditingValue.text.isEmpty) {
                            return const Iterable<String>.empty();
                          }

                          return talukaList
                              .map((e) => e['name'] ?? "")
                              .where((name) => name.toLowerCase().contains(
                                  textEditingValue.text.toLowerCase()))
                              .where((name) => name.isNotEmpty)
                              .toList();
                        },
                        displayStringForOption: (String option) => option,
                        onSelected: (String selectedName) {
                          final selectedTaluka = talukaList.firstWhere(
                            (element) => element['name'] == selectedName,
                            orElse: () => {"code": "0"},
                          );
                          selectedTalukaCode =
                              int.tryParse(selectedTaluka['code'] ?? "0");
                          print(
                              "Selected Taluka: $selectedName, Code: $selectedTalukaCode");
                        },
                        fieldViewBuilder: (BuildContext context,
                            TextEditingController textEditingController,
                            FocusNode focusNode,
                            VoidCallback onFieldSubmitted) {
                          talukaController = textEditingController;
                          return TextField(
                            controller: textEditingController,
                            focusNode: focusNode,
                            onSubmitted: (value) {
                              FocusScope.of(context)
                                  .requestFocus(districtFocus);
                            },
                            decoration: const InputDecoration(
                              labelText: 'Taluka',
                              border: OutlineInputBorder(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 200,
                      child: TextFielDesign(
                        lbltext: 'Pin Code',
                        textEditingController: pincodeController,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.left,
                        textInputType: TextInputType.text,
                        prefixIcon: Icons.pin,
                        focusNode: pincodeFocus,
                        onSubmitted: (value) {
                          FocusScope.of(context).requestFocus(mobile1Focus);
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: Autocomplete<String>(
                        optionsBuilder: (TextEditingValue textEditingValue) {
                          if (textEditingValue.text.isEmpty) {
                            return const Iterable<String>.empty();
                          }
                          return districtList
                              .map((e) => e['name'] ?? '')
                              .where((name) => name.toLowerCase().contains(
                                  textEditingValue.text.toLowerCase()))
                              .where((name) => name.isNotEmpty)
                              .toList();
                        },
                        onSelected: (String selectedName) {
                          final selectedDistrict = districtList.firstWhere(
                            (element) => element['name'] == selectedName,
                            orElse: () => {'code': '0'},
                          );
                          selectedDistrictCode =
                              int.tryParse(selectedDistrict['code'] ?? '0');
                          print(
                              "Selected District: $selectedName, Code: $selectedDistrictCode");
                        },
                        fieldViewBuilder: (BuildContext context,
                            TextEditingController textEditingController,
                            FocusNode focusNode,
                            VoidCallback onFieldSubmitted) {
                          districtController = textEditingController;
                          return TextField(
                            controller: textEditingController,
                            focusNode: focusNode, // ✅ use passed focusNode
                            onSubmitted: (value) {
                              FocusScope.of(context).requestFocus(mobile2Focus);
                            },
                            decoration: const InputDecoration(
                              labelText: 'District',
                              border: OutlineInputBorder(),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 200,
                      child: TextFielDesign(
                        lbltext: 'Mobile No 1',
                        textEditingController: mobile1Controller,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.left,
                        textInputType: TextInputType.text,
                        prefixIcon: Icons.phone,
                        focusNode: mobile1Focus,
                        onSubmitted: (value) {
                          FocusScope.of(context)
                              .requestFocus(openingbalanceFocus);
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      height: 50,
                      width: 200,
                      child: TextFielDesign(
                        lbltext: 'Mobile No 2',
                        textEditingController: mobile2Controller,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.left,
                        textInputType: TextInputType.text,
                        prefixIcon: Icons.phone,
                        focusNode: mobile2Focus,
                        onSubmitted: (value) {
                          FocusScope.of(context)
                              .requestFocus(transactiontypeFocus);
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
                        lbltext: 'Opening Balance',
                        textEditingController: openingbalanceController,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.left,
                        textInputType: TextInputType.text,
                        focusNode: openingbalanceFocus,
                        onSubmitted: (value) {
                          FocusScope.of(context).requestFocus(talukaFocus);
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      width: 100,
                      height: 60,
                      child: DropdownButtonFormField<String>(
                        value: selectedTransactionType,
                        decoration: InputDecoration(
                          labelText: 'Tran Type',
                          border: OutlineInputBorder(),
                        ),
                        items: ['Credit', 'Debit'].map((String type) {
                          return DropdownMenuItem<String>(
                            value: type,
                            child: Text(type),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedTransactionType = newValue;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomButton(
                      width: 100,
                      height: 40,
                      text: 'Delete',
                      icon: Icons.delete,
                      onPressed: () {},
                    ),
                    SizedBox(width: 20),
                    CustomButton(
                      width: 100,
                      height: 40,
                      text: 'Save',
                      // focusNode: saveFocus,
                      icon: Icons.save,
                      onPressed: () {
                        // FocusScope.of(context).requestFocus(societyCodeFocus);
                      },
                      onSubmitted: (value) {
                        // FocusScope.of(context).requestFocus(societyCodeFocus);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
