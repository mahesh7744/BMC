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
  TextEditingController codeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController societycodeController = TextEditingController();
  TextEditingController societynameController = TextEditingController();
  TextEditingController billnoController = TextEditingController();
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

  String selectedShift = '';
  String selectedtrsctype = '';
  String selectedMilk = '';
  bool isPrintSelected = false;
  bool isFatCategorySelected = false;
  List<Map<String, String>> tableData = [];
  Timer? _timer;

  void addToTable() {
    setState(() {
      tableData.add({
        'billno': billnoController.text,
        'Code': codeController.text,
        'Name': nameController.text,
        'MilkType': selectedMilk,
        'C/R': selectedtrsctype,
        'Litter': litterController.text,
        'Fat': fatController.text,
        'Rate': rateController.text,
        'Amount': amountController.text,
      });

      // Clear after adding
      billnoController.clear();

      codeController.clear();
      nameController.clear();

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
          color: Color.fromARGB(255, 58, 145, 245),
          size: 25,
        ),
        toolbarHeight: 40,
        backgroundColor: Colors.indigo.shade300,
        centerTitle: true,
        title: Text(
          'localmilksale'.tr(context),
          style: TextStyle(
            fontSize: 24,
            fontFamily: GlobalData.fontname,
            color: Color.fromARGB(255, 117, 233, 217),
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 1000,
            height: 670,
            color: Color.fromARGB(255, 190, 204, 236),
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
                        title: Text(
                          'morning'.tr(context),
                          style: TextStyle(
                            fontFamily: GlobalData.fontname,
                          ),
                        ),
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
                        title: Text(
                          'evening'.tr(context),
                          style: TextStyle(
                            fontFamily: GlobalData.fontname,
                          ),
                        ),
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
                      icon: Icons.description,
                      onPressed: () {
                        addToTable(); // हे महत्त्वाचं!
                      },
                      onSubmitted: (value) {
                        // FocusScope.of(context).requestFocus(societyCodeFocus); // हवं असल्यास
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 100,
                      child: TextFielDesign(
                        lbltext: 'code'.tr(context),
                        textEditingController: codeController,
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
                        textEditingController: nameController,
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
                        title: Text(
                          'cash'.tr(context),
                          style: TextStyle(
                            fontFamily: GlobalData.fontname,
                          ),
                        ),
                        leading: Radio<String>(
                          value: 'C',
                          groupValue: selectedtrsctype,
                          onChanged: (value) {
                            setState(() {
                              selectedtrsctype = value!;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 140,
                      height: 50,
                      child: ListTile(
                        title: Text(
                          'credit'.tr(context),
                          style: TextStyle(
                            fontFamily: GlobalData.fontname,
                          ),
                        ),
                        leading: Radio<String>(
                          value: 'R',
                          groupValue: selectedtrsctype,
                          onChanged: (value) {
                            setState(() {
                              selectedtrsctype = value!;
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
                          Text('print'.tr(context),
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: GlobalData.fontname,
                              )),
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
                          Text('fatwise'.tr(context),
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: GlobalData.fontname,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 120,
                      height: 80,
                      child: ListTile(
                        title: Text(
                          'cow'.tr(context),
                          style: TextStyle(
                            fontFamily: GlobalData.fontname,
                          ),
                        ),
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
                        title: Text(
                          'buffalo'.tr(context),
                          style: TextStyle(
                            fontFamily: GlobalData.fontname,
                          ),
                        ),
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
                    SizedBox(width: 8),
                    SizedBox(
                      height: 80,
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
                    SizedBox(width: 8),
                    SizedBox(
                      height: 80,
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
                    SizedBox(width: 8),
                    SizedBox(
                      height: 80,
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
                    SizedBox(width: 8),
                    SizedBox(
                      height: 80,
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
                    SizedBox(width: 8),
                    SizedBox(
                      width: 90,
                      height: 40,
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
                    SizedBox(width: 8),
                    CustomButton(
                      width: 120,
                      height: 40,
                      text: 'pendinglist'.tr(context),
                      // focusNode: saveFocus,
                      icon: Icons.hourglass_bottom,
                      onPressed: () {
                        // FocusScope.of(context).requestFocus(societyCodeFocus);
                      },
                      onSubmitted: (value) {
                        // FocusScope.of(context).requestFocus(societyCodeFocus);
                      },
                    ),
                    SizedBox(width: 8),
                    CustomButton(
                      width: 90,
                      height: 40,
                      text: 'delete'.tr(context),
                      icon: Icons.delete,
                      onPressed: () {},
                    ),
                  ],
                ),
                Container(
                  height: 200,
                  // color: Colors.redAccent,
                  child: Expanded(
                    child: Scrollbar(
                      controller: _scollcontroller,
                      thumbVisibility: true,
                      thickness: 8,
                      radius: Radius.circular(10),
                      scrollbarOrientation: ScrollbarOrientation.right,
                      child: SingleChildScrollView(
                        controller: _scollcontroller,
                        scrollDirection: Axis.vertical,
                        child: SingleChildScrollView(
                          scrollDirection: Axis
                              .horizontal, // 👈 Add this for horizontal scroll
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                            ),
                            child: Table(
                              border: TableBorder.all(
                                  color: Colors.black, width: 2),
                              defaultColumnWidth:
                                  IntrinsicColumnWidth(), // Optional
                              children: [
                                TableRow(
                                  decoration: BoxDecoration(
                                      color: Colors.indigo.shade300),
                                  children: [
                                    _tableCell('billno'.tr(context),
                                        isHeader: true, widthSize: 90),
                                    _tableCell('C/R'.tr(context),
                                        isHeader: true, widthSize: 90),
                                    _tableCell('code'.tr(context),
                                        isHeader: true, widthSize: 90),
                                    _tableCell('name'.tr(context),
                                        isHeader: true,
                                        widthSize: 310), // 👈 Wider
                                    _tableCell('milktype'.tr(context),
                                        isHeader: true, widthSize: 90),
                                    _tableCell('litter'.tr(context),
                                        isHeader: true, widthSize: 90),
                                    _tableCell('fat'.tr(context),
                                        isHeader: true, widthSize: 70),
                                    _tableCell('rate'.tr(context),
                                        isHeader: true, widthSize: 70),
                                    _tableCell('amount'.tr(context),
                                        isHeader: true, widthSize: 100),
                                  ],
                                ),
                                ...tableData.map((data) {
                                  return TableRow(
                                    children: [
                                      _tableCell(
                                          data['billno']?.toString() ?? '',
                                          widthSize: 80),
                                      _tableCell(data['C/R']?.toString() ?? '',
                                          widthSize: 80),
                                      _tableCell(data['Code']?.toString() ?? '',
                                          widthSize: 80),
                                      _tableCell(data['Name']?.toString() ?? '',
                                          widthSize: 240), // 👈 Wider
                                      _tableCell(
                                          data['MilkType']?.toString() ?? '',
                                          widthSize: 90),
                                      _tableCell(
                                          data['Litter']?.toString() ?? '',
                                          widthSize: 90),
                                      _tableCell(data['Fat']?.toString() ?? ''),
                                      _tableCell(data['Rate']?.toString() ?? '',
                                          widthSize: 70),
                                      _tableCell(
                                          data['Amount']?.toString() ?? '',
                                          widthSize: 100),
                                    ],
                                  );
                                }).toList(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      // color: Colors.redAccent,
                      height: 250,
                      width: 600,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width:
                                      80), // खालील Member/Litter align करण्यासाठी रिकामा box
                              boxText('cow'.tr(context)),
                              boxText('buffalo'.tr(context)),
                              boxText('total'.tr(context)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              boxText('litter'.tr(context)),
                              boxText('$cowlitter'),
                              boxText('$buffalolitter'),
                              boxText('$totallitter'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              boxText('avgfat'.tr(context)),
                              boxText('$cowavgfat'),
                              boxText('$buffaloavgfat'),
                              boxText('$totalavgfat'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              boxText('avgrate'.tr(context)),
                              boxText('$cowavgrate'),
                              boxText('$buffaloavgrate'),
                              boxText('$totalavgrate'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              boxText('amount'.tr(context)),
                              boxText('$cowamount'),
                              boxText('$buffaloamount'),
                              boxText('$totalamount'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 400,
                      height: 260,
                      child: Column(
                        children: [
                          Row(
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
                              Text('to'.tr(context)),
                              SizedBox(width: 10),
                              SizedBox(
                                height: 40,
                                width: 160,
                                child: DatePickerField(
                                  controller: trscDateController,
                                  labelText: 'date'.tr(context),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              SizedBox(width: 60),
                              SizedBox(
                                height: 50,
                                width: 100,
                                child: TextFielDesign(
                                  lbltext: 'code'.tr(context),
                                  textEditingController: codeController,
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
                              Text('to'.tr(context)),
                              SizedBox(width: 10),
                              SizedBox(
                                height: 50,
                                width: 100,
                                child: TextFielDesign(
                                  lbltext: 'code'.tr(context),
                                  textEditingController: codeController,
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
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              SizedBox(width: 40),
                              CustomButton(
                                width: 80,
                                height: 40,
                                text: 'bill'.tr(context),
                                icon: Icons.receipt_long,
                                onPressed: () {
                                  addToTable(); // हे महत्त्वाचं!
                                },
                                onSubmitted: (value) {
                                  // FocusScope.of(context).requestFocus(societyCodeFocus); // हवं असल्यास
                                },
                              ),
                              SizedBox(width: 10),
                              CustomButton(
                                width: 90,
                                height: 40,
                                text: 'ladger'.tr(context),
                                icon: Icons.book,
                                onPressed: () {
                                  addToTable(); // हे महत्त्वाचं!
                                },
                                onSubmitted: (value) {
                                  // FocusScope.of(context).requestFocus(societyCodeFocus); // हवं असल्यास
                                },
                              ),
                              SizedBox(width: 10),
                              CustomButton(
                                width: 100,
                                height: 40,
                                text: 'register'.tr(context),
                                icon: Icons.app_registration,
                                onPressed: () {
                                  addToTable(); // हे महत्त्वाचं!
                                },
                                onSubmitted: (value) {
                                  // FocusScope.of(context).requestFocus(societyCodeFocus); // हवं असल्यास
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              SizedBox(width: 40),
                              SizedBox(
                                height: 50,
                                width: 100,
                                child: TextFielDesign(
                                  lbltext: 'cow'.tr(context),
                                  textEditingController: codeController,
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
                                width: 100,
                                child: TextFielDesign(
                                  lbltext: 'buffalo'.tr(context),
                                  textEditingController: codeController,
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
                              CustomButton(
                                width: 90,
                                height: 40,
                                text: 'save'.tr(context),
                                icon: Icons.save,
                                onPressed: () {
                                  addToTable(); // हे महत्त्वाचं!
                                },
                                onSubmitted: (value) {
                                  // FocusScope.of(context).requestFocus(societyCodeFocus); // हवं असल्यास
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
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
          // color: Colors.white,
          fontFamily: GlobalData.fontname,
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
