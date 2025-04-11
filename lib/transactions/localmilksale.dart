import 'dart:async';

import 'package:bmc/customewidgets/date_widget.dart';
import 'package:bmc/other/globaldata.dart';
import 'package:flutter/material.dart';
import 'package:bmc/customewidgets/custom_button.dart';
import 'package:bmc/customewidgets/custom_textfield.dart';
import 'package:bmc/other/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Localmilksale extends StatefulWidget {
  const Localmilksale({super.key});

  @override
  State<Localmilksale> createState() => _LocalmilksaleState();
}

class _LocalmilksaleState extends State<Localmilksale> {
  TextEditingController trscDateController = TextEditingController();
  TextEditingController trscTimeController = TextEditingController();
  TextEditingController rootcodeController = TextEditingController();
  TextEditingController rootnameController = TextEditingController();
  TextEditingController societycodeController = TextEditingController();
  TextEditingController societynameController = TextEditingController();
  TextEditingController samplenoController = TextEditingController();
  TextEditingController canController = TextEditingController();
  TextEditingController litterController = TextEditingController();
  TextEditingController fatController = TextEditingController();
  TextEditingController snfController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  final ScrollController _scollcontroller = ScrollController();
  int cowmember = 32;
  int buffalomember = 32;
  int totalmember = 32;
  double cowlitter = 13045;
  double buffalolitter = 18945;
  double totallitter = 30000;
  double cowavgfat = 3.80;
  double buffaloavgfat = 6.90;
  double totalavgfat = 10.70;
  double cowavgsnf = 6.90;
  double buffaloavgsnf = 6.90;
  double totalavgsnf = 6.90;
  double cowavgrate = 27.79;
  double buffaloavgrate = 27.79;
  double totalavgrate = 27.79;
  double cowamount = 488883.89;
  double buffaloamount = 488883.89;
  double totalamount = 488883.89;
  double totallitter1 = 78799;
  // double totalamount = 410101.30;

  String selectedShift = 'Morning';
  String selectedamount = 'Cash';
  String selectedMilk = 'Cow';
  bool isPrintSelected = false;
  bool isFatCategorySelected = false;
  List<Map<String, String>> tableData = [];
  Timer? _timer;

  void addToTable() {
    setState(() {
      tableData.add({
        'SampleNo': samplenoController.text,
        'RootCode': rootcodeController.text,
        'SocietyCode': societycodeController.text,
        'SocietyName': societynameController.text,
        'Can': canController.text,
        'Litter': litterController.text,
        'Fat': fatController.text,
        'SNF': snfController.text,
        'Rate': rateController.text,
        'Amount': amountController.text,
        'Time': trscTimeController.text,
      });

      // Clear after adding
      samplenoController.clear();
      rootcodeController.clear();
      societycodeController.clear();
      societynameController.clear();
      canController.clear();
      litterController.clear();
      fatController.clear();
      snfController.clear();
      rateController.clear();
      amountController.clear();
      trscTimeController.clear();
    });
  }

  @override
  void initState() {
    super.initState();

    _updateTime();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) => _updateTime());
  }

  void _updateTime() {
    final now = DateTime.now();
    final formattedTime = DateFormat('HH:mm:ss:a').format(now);
    trscTimeController.text = formattedTime;
  }

  @override
  void dispose() {
    _timer?.cancel();
    trscTimeController.dispose();
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
        title: Text(
          'localmilksale'.tr(context),
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
            width: 1000,
            height: 600,
            // color: Colors.amberAccent,
            child: Column(
              children: [
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 40,
                      width: 160,
                      child: DatePickerField(
                        controller: trscDateController,
                        labelText: 'date'.tr(context),
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      width: 150,
                      height: 40,
                      child: ListTile(
                        title: Text('morning'.tr(context)),
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
                    SizedBox(width: 20),
                    SizedBox(
                      width: 160,
                      height: 40,
                      child: ListTile(
                        title: Text('evening'.tr(context)),
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
                    CustomButton(
                      width: 120,
                      height: 40,
                      text: 'shiftreport'.tr(context),
                      icon: Icons.save,
                      onPressed: () {
                        addToTable(); // हे महत्त्वाचं!
                      },
                      onSubmitted: (value) {
                        // FocusScope.of(context).requestFocus(societyCodeFocus); // हवं असल्यास
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 100,
                      child: TextFielDesign(
                        lbltext: 'code'.tr(context),
                        textEditingController: societycodeController,
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
                      height: 50,
                      width: 380,
                      child: TextFielDesign(
                        lbltext: 'name'.tr(context),
                        textEditingController: societynameController,
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
                      width: 140,
                      height: 50,
                      child: ListTile(
                        title: Text('cash'.tr(context)),
                        leading: Radio<String>(
                          value: 'c',
                          groupValue: selectedamount,
                          onChanged: (value) {
                            setState(() {
                              selectedamount = value!;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 140,
                      height: 50,
                      child: ListTile(
                        title: Text('credit'.tr(context)),
                        leading: Radio<String>(
                          value: 'credit',
                          groupValue: selectedamount,
                          onChanged: (value) {
                            setState(() {
                              selectedamount = value!;
                            });
                          },
                        ),
                      ),
                    ),

                    SizedBox(
                      width: 70,
                      height: 32,
                      child: Row(
                        children: [
                          Checkbox(
                            value: isPrintSelected,
                            onChanged: (value) {
                              setState(() {
                                isPrintSelected = value!;
                              });
                            },
                          ),
                          Text('Print', style: TextStyle(fontSize: 14)),
                        ],
                      ),
                    ),
                    SizedBox(width: 10), // spacing between checkboxes
                    SizedBox(
                      width: 130,
                      height: 32,
                      child: Row(
                        children: [
                          Checkbox(
                            value: isFatCategorySelected,
                            onChanged: (value) {
                              setState(() {
                                isFatCategorySelected = value!;
                              });
                            },
                          ),
                          Text('Fat Category', style: TextStyle(fontSize: 14)),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 80,
                      child: ListTile(
                        title: Text('cow'.tr(context)),
                        leading: Radio<String>(
                          value: 'C',
                          groupValue: selectedMilk,
                          onChanged: (value) {
                            setState(() {
                              selectedMilk = value!;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 140,
                      height: 80,
                      child: ListTile(
                        title: Text('buffalo'.tr(context)),
                        leading: Radio<String>(
                          value: 'B',
                          groupValue: selectedMilk,
                          onChanged: (value) {
                            setState(() {
                              selectedMilk = value!;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      height: 90,
                      width: 90,
                      child: TextFielDesign(
                        lbltext: 'litter'.tr(context),
                        textEditingController: litterController,
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        textAlign: TextAlign.center,
                        textInputType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d*\.?\d{0,2}'))
                        ],
                        // focusNode: societyCodeFocus,
                        // onSubmitted: (value) {
                        //   FocusScope.of(context).requestFocus(rootnameFocus);
                        // },
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      height: 90,
                      width: 80,
                      child: TextFielDesign(
                        lbltext: 'fat'.tr(context),
                        textEditingController: fatController,
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        textAlign: TextAlign.center,
                        textInputType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d*\.?\d{0,2}'))
                        ],
                        // focusNode: societyCodeFocus,
                        // onSubmitted: (value) {
                        //   FocusScope.of(context).requestFocus(rootnameFocus);
                        // },
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      height: 90,
                      width: 80,
                      child: TextFielDesign(
                        lbltext: 'rate'.tr(context),
                        textEditingController: rateController,
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        textAlign: TextAlign.center,
                        textInputType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d*\.?\d{0,2}'))
                        ],
                        // focusNode: societyCodeFocus,
                        // onSubmitted: (value) {
                        //   FocusScope.of(context).requestFocus(rootnameFocus);
                        // },
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      height: 90,
                      width: 100,
                      child: TextFielDesign(
                        lbltext: 'amount'.tr(context),
                        textEditingController: amountController,
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        textAlign: TextAlign.center,
                        textInputType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d*\.?\d{0,2}'))
                        ],
                        // focusNode: societyCodeFocus,
                        // onSubmitted: (value) {
                        //   FocusScope.of(context).requestFocus(rootnameFocus);
                        // },
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      width: 100,
                      height: 20,
                      child: CustomButton(
                        text: 'save'.tr(context),
                        icon: Icons.save,
                        onPressed: () {
                          addToTable(); // हे महत्त्वाचं!
                        },
                        onSubmitted: (value) {
                          // FocusScope.of(context).requestFocus(societyCodeFocus); // हवं असल्यास
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }

  Widget boxText(String text) {
    return SizedBox(
      width: 80,
      height: 30,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _tableCell(
    String text, {
    bool isHeader = false,
    double? widthSize,
  }) {
    return Container(
      width: widthSize,
      padding: EdgeInsets.all(8.0),
      alignment: Alignment.center,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
