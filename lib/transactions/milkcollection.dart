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
  String selectedMilk = 'Cow';
  List<Map<String, String>> tableData = [];
  Timer? _timer;

  void addToTable() {
    setState(() {
      tableData.add({
        'SampleNo': samplenoController.text,
        'RootCode': rootcodeController.text,
        'SocietyCode': societycodeController.text,
        'SocietyName': societynameController.text,
        'MilkType': selectedMilk,
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
          'milkcollection'.tr(context),
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'Roboto',
            color: Color.fromARGB(255, 58, 245, 226),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // color: Colors.amberAccent,
                width: 550,
                height: 340,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
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
                          SizedBox(width: 20),
                          SizedBox(
                            height: 40,
                            width: 150,
                            child: TextFormField(
                              controller: trscTimeController,
                              readOnly: true,
                              decoration: InputDecoration(
                                labelText: 'time'.tr(context),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
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
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          SizedBox(
                            height: 50,
                            width: 150,
                            child: TextFielDesign(
                              lbltext: 'rootcode'.tr(context),
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
                            height: 50,
                            width: 380,
                            child: TextFielDesign(
                              lbltext: 'rootname'.tr(context),
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
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          SizedBox(
                            height: 50,
                            width: 150,
                            child: TextFielDesign(
                              lbltext: 'societycode'.tr(context),
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
                              lbltext: 'societyname'.tr(context),
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
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 150,
                            height: 40,
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
                          SizedBox(width: 10),
                          SizedBox(
                            width: 150,
                            height: 40,
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
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(
                            height: 60,
                            width: 60,
                            child: TextFielDesign(
                              lbltext: 'sampleno'.tr(context),
                              textEditingController: samplenoController,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              // isReadOnly: true,

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
                            height: 60,
                            width: 60,
                            child: TextFielDesign(
                              lbltext: 'can'.tr(context),
                              textEditingController: canController,
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
                            height: 60,
                            width: 70,
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
                            height: 60,
                            width: 60,
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
                            height: 60,
                            width: 60,
                            child: TextFielDesign(
                              lbltext: 'SNF',
                              textEditingController: snfController,
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
                            height: 60,
                            width: 80,
                            child: TextFielDesign(
                              lbltext: 'rate'.tr(context),
                              textEditingController: rateController,
                              // isReadOnly: true,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
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
                            height: 60,
                            width: 90,
                            child: TextFielDesign(
                              lbltext: 'amount'.tr(context),
                              textEditingController: amountController,
                              // isReadOnly: true,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
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
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomButton(
                            width: 80,
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
                          SizedBox(width: 10),
                          CustomButton(
                            width: 80,
                            height: 40,
                            text: 'print'.tr(context),
                            // focusNode: saveFocus,
                            icon: Icons.save,
                            onPressed: () {
                              // FocusScope.of(context).requestFocus(societyCodeFocus);
                            },
                            onSubmitted: (value) {
                              // FocusScope.of(context).requestFocus(societyCodeFocus);
                            },
                          ),
                          SizedBox(width: 10),
                          CustomButton(
                            width: 80,
                            height: 40,
                            text: 'delete'.tr(context),
                            icon: Icons.delete,
                            onPressed: () {},
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                // color: Colors.redAccent,
                height: 340,
                width: 470,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        boxText('member'.tr(context)),
                        boxText('$cowmember'),
                        boxText('$buffalomember'),
                        boxText('$totalmember'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        boxText('litter'.tr(context)),
                        boxText('$cowlitter'),
                        boxText('$buffalolitter'),
                        boxText('$totallitter'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        boxText('avgfat'.tr(context)),
                        boxText('$cowavgfat'),
                        boxText('$buffaloavgfat'),
                        boxText('$totalavgfat'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        boxText('avgsnf'.tr(context)),
                        boxText('$cowavgsnf'),
                        boxText('$buffaloavgsnf'),
                        boxText('$totalavgsnf'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        boxText('avgrate'.tr(context)),
                        boxText('$cowavgrate'),
                        boxText('$buffaloavgrate'),
                        boxText('$totalavgrate'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
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
            ],
          ),
          SizedBox(height: 10),
          Expanded(
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
                  scrollDirection:
                      Axis.horizontal, // 👈 Add this for horizontal scroll
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: Table(
                      border: TableBorder.all(color: Colors.black, width: 2),
                      defaultColumnWidth: IntrinsicColumnWidth(), // Optional
                      children: [
                        TableRow(
                          decoration:
                              BoxDecoration(color: Colors.indigo.shade300),
                          children: [
                            _tableCell('sampleno'.tr(context),
                                isHeader: true, widthSize: 90),
                            _tableCell('rootcode'.tr(context),
                                isHeader: true, widthSize: 90),
                            _tableCell('societycode'.tr(context),
                                isHeader: true, widthSize: 90),
                            _tableCell('societyname'.tr(context),
                                isHeader: true, widthSize: 310), // 👈 Wider
                            _tableCell('milktype'.tr(context),
                                isHeader: true, widthSize: 90),
                            _tableCell('can'.tr(context),
                                isHeader: true, widthSize: 90),
                            _tableCell('litter'.tr(context),
                                isHeader: true, widthSize: 70),
                            _tableCell('fat'.tr(context),
                                isHeader: true, widthSize: 70),
                            _tableCell('SNF', isHeader: true, widthSize: 70),
                            _tableCell('rate'.tr(context),
                                isHeader: true, widthSize: 90),
                            _tableCell('amount'.tr(context),
                                isHeader: true, widthSize: 150),
                            _tableCell('time'.tr(context),
                                isHeader: true, widthSize: 150),
                          ],
                        ),
                        ...tableData.map((data) {
                          return TableRow(
                            children: [
                              _tableCell(data['SampleNo']?.toString() ?? '',
                                  widthSize: 80),
                              _tableCell(data['RootCode']?.toString() ?? '',
                                  widthSize: 80),
                              _tableCell(data['SocietyCode']?.toString() ?? '',
                                  widthSize: 80),
                              _tableCell(data['SocietyName']?.toString() ?? '',
                                  widthSize: 240), // 👈 Wider
                              _tableCell(data['MilkType']?.toString() ?? '',
                                  widthSize: 90),
                              _tableCell(data['Can']?.toString() ?? '',
                                  widthSize: 90),
                              _tableCell(data['Litter']?.toString() ?? ''),
                              _tableCell(data['Fat']?.toString() ?? '',
                                  widthSize: 70),
                              _tableCell(data['SNF']?.toString() ?? '',
                                  widthSize: 70),
                              _tableCell(data['Rate']?.toString() ?? '',
                                  widthSize: 90),
                              _tableCell(data['Amount']?.toString() ?? ''),
                              _tableCell(data['Time']?.toString() ?? ''),
                            ],
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
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
