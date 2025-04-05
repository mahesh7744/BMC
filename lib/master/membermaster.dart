import 'package:bmc/customewidgets/custom_button.dart';
import 'package:bmc/customewidgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  TextEditingController mobilenumber1Controller = TextEditingController();
  TextEditingController cowcommitionController = TextEditingController();
  TextEditingController ifsccodeController = TextEditingController();
  TextEditingController mobilenumber2Controller = TextEditingController();
  TextEditingController buffalocommitionController = TextEditingController();
  TextEditingController fssaiController = TextEditingController();
  TextEditingController fixeddepositController = TextEditingController();
  TextEditingController advancereduceController = TextEditingController();
  TextEditingController taxnameController = TextEditingController();
  TextEditingController talukaController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController rootController = TextEditingController();
  TextEditingController villageController = TextEditingController();

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
    {"code": "101", "name": "Kagal "},
    {"code": "102", "name": "Hupri "},
    {"code": "103", "name": "Ich "},
  ];
  int? selectedRootCode;

  final List<Map<String, dynamic>> rateChartList = [
    {"code": 101, "name": "Dairy Chart"},
    {"code": 102, "name": "Buffalo Rate"},
    {"code": 103, "name": "Cow Rate"},
  ];

  int? selectedRateCode;

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
  final FocusNode rootnameFocus = FocusNode();
  final FocusNode talukaFocus = FocusNode();
  final FocusNode districtFocus = FocusNode();
  final FocusNode rateFocus = FocusNode();
  final FocusNode deleteFocus = FocusNode();
  final FocusNode saveFocus = FocusNode();

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
    rootnameFocus.dispose();
    deleteFocus.dispose();
    saveFocus.dispose();
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
          'Society Master',
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
              width: 700,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Row(
                    children: [
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
                            FocusScope.of(context).requestFocus(rootnameFocus);
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: Autocomplete<String>(
                          optionsBuilder: (TextEditingValue textEditingValue) {
                            if (textEditingValue.text.isEmpty) {
                              return const Iterable<String>.empty();
                            }
                            return rootList.map((e) => e['name']!).where(
                                (name) => name.toLowerCase().contains(
                                    textEditingValue.text.toLowerCase()));
                          },
                          onSelected: (String selectedName) {
                            final selectedItem = rootList
                                .firstWhere((e) => e['name'] == selectedName);
                            selectedRootCode =
                                int.tryParse(selectedItem['code'] ?? '');
                            print("Selected Root Code: $selectedRootCode");
                          },
                          fieldViewBuilder: (context, controller, focusNode,
                              onFieldSubmitted) {
                            return TextField(
                              controller: controller,
                              focusNode: rootnameFocus,
                              onSubmitted: (value) {
                                FocusScope.of(context)
                                    .requestFocus(societyNameFocus);
                              },
                              decoration: InputDecoration(
                                labelText: 'Root Name',
                                border: OutlineInputBorder(),
                              ),
                            );
                          },
                        ),
                      )
                    ],
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
                              color: Colors.lightBlue.shade900,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
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
                                color: Colors.lightBlue.shade900),
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
                              color: Colors.lightBlue.shade900,
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
                          prefixIcon: Icons.location_on,
                          focusNode: addressFocus,
                          onSubmitted: (value) {
                            FocusScope.of(context).requestFocus(villageFocus);
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 60,
                        width: 260,
                        child: TextFielDesign(
                          lbltext: 'Account Number',
                          textEditingController: accountnumberController,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
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
                        width: 200,
                        height: 60,
                        child: Autocomplete<String>(
                          optionsBuilder: (TextEditingValue textEditingValue) {
                            if (textEditingValue.text == '') {
                              return const Iterable<String>.empty();
                            }
                            return villageList.map((e) => e['name']!).where(
                                (String option) => option
                                    .toLowerCase()
                                    .contains(
                                        textEditingValue.text.toLowerCase()));
                          },
                          onSelected: (String selectedName) {
                            final selectedVillageCode = villageList.firstWhere(
                                (element) => element['name'] == selectedName);
                            selectedDistrictCode =
                                int.tryParse(selectedVillageCode['code'] ?? '');
                            print("Selected Vilage Code: $selectedVillageCode");
                          },
                          fieldViewBuilder: (BuildContext context,
                              TextEditingController textEditingController,
                              FocusNode focusNode,
                              VoidCallback onFieldSubmitted) {
                            return TextField(
                              controller: textEditingController,
                              focusNode: villageFocus,
                              onSubmitted: (value) {
                                FocusScope.of(context)
                                    .requestFocus(pinCodeFocus);
                              },
                              decoration: InputDecoration(
                                labelText: 'Village/City',
                                border: OutlineInputBorder(),
                              ),
                            );
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
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}'))
                          ],
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
                          prefixIcon: Icons.pin,
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
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}'))
                          ],
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
                          lbltext: 'Mobile No 1',
                          textEditingController: mobilenumber2Controller,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          textInputType: TextInputType.text,
                          prefixIcon: Icons.phone,
                          focusNode: phoneNumberFocus,
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
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}'))
                          ],
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
                          lbltext: 'Mobile No 2',
                          textEditingController: mobilenumber2Controller,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                          textInputType: TextInputType.text,
                          prefixIcon: Icons.mobile_friendly,
                          focusNode: mobileFocus,
                          onSubmitted: (value) {
                            FocusScope.of(context).requestFocus(talukaFocus);
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
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}'))
                          ],
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
                        width: 200,
                        height: 60,
                        child: Autocomplete<String>(
                          optionsBuilder: (TextEditingValue textEditingValue) {
                            if (textEditingValue.text.isEmpty) {
                              return const Iterable<String>.empty();
                            }
                            return talukaList
                                .map((e) => e['name'] ?? "")
                                .where((name) => name.toLowerCase().contains(
                                    textEditingValue.text.toLowerCase()))
                                .toList();
                          },
                          displayStringForOption: (String option) => option,
                          onSelected: (String selectedName) {
                            final selectedTaluka = talukaList.firstWhere(
                              (element) => element['name'] == selectedName,
                              orElse: () => {"code": "0"},
                            );
                            selectedTalukaCode =
                                int.tryParse(selectedTaluka['code'] ?? "");
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
                              focusNode: talukaFocus,
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
                      SizedBox(width: 10),
                      SizedBox(
                        height: 60,
                        width: 150,
                        child: TextFielDesign(
                          lbltext: 'Fixed dep',
                          textEditingController: fixeddepositController,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.center,
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
                          textAlign: TextAlign.right,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}'))
                          ],
                          focusNode: advanceReduceFocus,
                          onSubmitted: (value) {
                            FocusScope.of(context).requestFocus(rateFocus);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(
                        width: 200,
                        height: 60,
                        child: Autocomplete<String>(
                          optionsBuilder: (TextEditingValue textEditingValue) {
                            if (textEditingValue.text == '') {
                              return const Iterable<String>.empty();
                            }
                            return districtList.map((e) => e['name']!).where(
                                (String option) => option
                                    .toLowerCase()
                                    .contains(
                                        textEditingValue.text.toLowerCase()));
                          },
                          onSelected: (String selectedName) {
                            final selectedDistrict = districtList.firstWhere(
                                (element) => element['name'] == selectedName);
                            selectedDistrictCode =
                                int.tryParse(selectedDistrict['code'] ?? '');
                            print(
                                "Selected District Code: $selectedDistrictCode");
                          },
                          fieldViewBuilder: (BuildContext context,
                              TextEditingController textEditingController,
                              FocusNode focusNode,
                              VoidCallback onFieldSubmitted) {
                            return TextField(
                              controller: textEditingController,
                              focusNode: districtFocus,
                              onSubmitted: (value) {
                                FocusScope.of(context)
                                    .requestFocus(cowDepositFocus);
                              },
                              decoration: InputDecoration(
                                labelText: 'District',
                                border: OutlineInputBorder(),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        width: 200,
                        height: 60,
                        child: Autocomplete<String>(
                          optionsBuilder: (TextEditingValue textEditingValue) {
                            if (textEditingValue.text.isEmpty) {
                              return const Iterable<String>.empty();
                            }
                            return rateChartList
                                .map((e) => e['name'] as String)
                                .where((rate) => rate.toLowerCase().contains(
                                    textEditingValue.text.toLowerCase()));
                          },
                          onSelected: (String selectedName) {
                            final selected = rateChartList
                                .firstWhere((e) => e['name'] == selectedName);
                            selectedRateCode = selected['code'];
                            print("Selected Rate Code: $selectedRateCode");
                          },
                          fieldViewBuilder: (context, controller, focusNode,
                              onFieldSubmitted) {
                            return TextField(
                              controller: controller,
                              focusNode: rateFocus,
                              onSubmitted: (value) {
                                FocusScope.of(context).requestFocus(saveFocus);
                              },
                              decoration: InputDecoration(
                                labelText: 'Rate Chart',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.bar_chart),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        width: 150,
                        height: 60,
                        child: CheckboxListTile(
                          title: Text("On/Off", style: TextStyle(fontSize: 16)),
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
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
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
                        focusNode: saveFocus,
                        icon: Icons.save,
                        onPressed: () {
                          FocusScope.of(context).requestFocus(societyCodeFocus);
                        },
                        onSubmitted: (value) {
                          FocusScope.of(context).requestFocus(societyCodeFocus);
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
