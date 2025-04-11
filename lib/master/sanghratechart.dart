import 'dart:io';

import 'package:bmc/customewidgets/custom_button.dart';
import 'package:bmc/customewidgets/custom_textfield.dart';
import 'package:bmc/customewidgets/date_widget.dart';
import 'package:bmc/other/app_localizations.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class Sanghratechart extends StatefulWidget {
  const Sanghratechart({super.key});

  @override
  State<Sanghratechart> createState() => _SanghratechartState();
}

class _SanghratechartState extends State<Sanghratechart> {
  TextEditingController cowfatController = TextEditingController();
  TextEditingController cowsnfController = TextEditingController();
  TextEditingController cowrateController = TextEditingController();

  TextEditingController buffatController = TextEditingController();
  TextEditingController bufsnfController = TextEditingController();
  TextEditingController bufrateController = TextEditingController();

  TextEditingController trscDateController = TextEditingController();
  TextEditingController chartnameController = TextEditingController();

  List<Map<String, dynamic>> cowrateList = [];

  List<Map<String, dynamic>> bufrateList = [];

  // Focus nodes for handling focus transitions
  FocusNode cowfatFocus = FocusNode();
  FocusNode cowsnfFocus = FocusNode();
  FocusNode cowrateFocus = FocusNode();

  FocusNode buffatFocus = FocusNode();
  FocusNode bufsnfFocus = FocusNode();
  FocusNode bufrateFocus = FocusNode();
  FocusNode chartnameFocus = FocusNode();

  @override
  void dispose() {
    // Dispose of focus nodes to avoid memory leaks
    cowfatFocus.dispose();
    cowsnfFocus.dispose();
    cowrateFocus.dispose();
    buffatFocus.dispose();
    bufsnfFocus.dispose();
    bufrateFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent.shade100,
        centerTitle: true,
        title: Text(
          'sanghratechart'.tr(context),
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'Roboto',
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Row(
                  children: [
                    SizedBox(
                      height: 60,
                      width: 160,
                      child: DatePickerField(
                        controller: trscDateController,
                        labelText: 'date'.tr(context),
                      ),
                    ),
                    SizedBox(width: 20),
                    SizedBox(
                      height: 60,
                      width: 220,
                      child: TextFielDesign(
                        lbltext: 'chartname'.tr(context),
                        textEditingController: chartnameController,
                        textInputType: TextInputType.text,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.left,
                        focusNode: chartnameFocus,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 50),
                  CustomButton(
                    width: 260,
                    height: 40,
                    icon: Icons.chat_rounded,
                    text: 'Cow RateChart From Excel',
                    onPressed: () {
                      _cowpickExcelFile();
                    },
                  ),
                  SizedBox(width: 120),
                  CustomButton(
                    width: 260,
                    height: 40,
                    icon: Icons.chat_rounded,
                    text: 'Buffalo RateChart From Excel',
                    onPressed: () {
                      _bufpickExcelFile();
                    },
                  ),
                ],
              ),
              Container(
                height: 1000,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 20),
                    Container(
                      height: 950,
                      child: Column(
                        children: [
                          Text(
                            'cow'.tr(context),
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 16,
                              color: Colors.indigoAccent.shade200,
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 80,
                                  child: TextFielDesign(
                                    lbltext: 'fat'.tr(context),
                                    textEditingController: cowfatController,
                                    textInputType: TextInputType.text,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    textAlign: TextAlign.center,
                                    focusNode: cowfatFocus,
                                    onSubmitted: (value) {
                                      FocusScope.of(context)
                                          .requestFocus(cowsnfFocus);
                                    },
                                  ),
                                ),
                                SizedBox(width: 10),
                                SizedBox(
                                  width: 80,
                                  child: TextFielDesign(
                                    lbltext: 'SNF',
                                    textEditingController: cowsnfController,
                                    textInputType: TextInputType.text,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    textAlign: TextAlign.center,
                                    focusNode: cowsnfFocus,
                                    onSubmitted: (value) {
                                      FocusScope.of(context)
                                          .requestFocus(cowrateFocus);
                                    },
                                  ),
                                ),
                                SizedBox(width: 10),
                                SizedBox(
                                  width: 80,
                                  child: TextFielDesign(
                                    lbltext: 'rate'.tr(context),
                                    textEditingController: cowrateController,
                                    textInputType: TextInputType.text,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    textAlign: TextAlign.right,
                                    focusNode: cowrateFocus,
                                    onSubmitted: (value) {
                                      cowaddDataRow();
                                    },
                                  ),
                                ),
                                SizedBox(width: 10),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      cowrateList.clear();
                                    });
                                  },
                                  icon: const Icon(Icons.delete),
                                  tooltip: 'Clear Cow Rates',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 800,
                            child: SingleChildScrollView(
                              child: DataTable(
                                border: TableBorder.all(color: Colors.black),
                                columns: [
                                  DataColumn(
                                    label: SizedBox(
                                      width: 40,
                                      height: 20,
                                      child: Text(
                                        'fat'.tr(context),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: SizedBox(
                                      width: 40,
                                      height: 20,
                                      child: Text(
                                        'SNF',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: SizedBox(
                                      width: 40,
                                      height: 20,
                                      child: Text(
                                        'rate'.tr(context),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                                rows: cowrateList.map((rate) {
                                  return DataRow(cells: [
                                    DataCell(
                                      SizedBox(
                                        width: 40,
                                        height: 20,
                                        child: Center(
                                          child: Text(
                                            rate["fat"] ?? "",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      SizedBox(
                                        width: 40,
                                        height: 20,
                                        child: Center(
                                          child: Text(
                                            rate["snf"] ?? "",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      SizedBox(
                                        width: 40,
                                        height: 20,
                                        child: Center(
                                          child: Text(
                                            rate["rate"] ?? "",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]);
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 40),
                    Container(
                      height: 950,
                      child: Column(
                        children: [
                          Text(
                            'buffalo'.tr(context),
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 16,
                                color: Colors.indigoAccent.shade200),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 80,
                                  child: TextFielDesign(
                                    lbltext: 'fat'.tr(context),
                                    textEditingController: buffatController,
                                    textInputType: TextInputType.text,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    textAlign: TextAlign.center,
                                    focusNode: buffatFocus,
                                    onSubmitted: (value) {
                                      FocusScope.of(context)
                                          .requestFocus(bufsnfFocus);
                                    },
                                  ),
                                ),
                                SizedBox(width: 10),
                                SizedBox(
                                  width: 80,
                                  child: TextFielDesign(
                                    lbltext: 'SNF',
                                    textEditingController: bufsnfController,
                                    textInputType: TextInputType.text,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    textAlign: TextAlign.center,
                                    focusNode: bufsnfFocus,
                                    onSubmitted: (value) {
                                      FocusScope.of(context)
                                          .requestFocus(bufrateFocus);
                                    },
                                  ),
                                ),
                                SizedBox(width: 10),
                                SizedBox(
                                  width: 80,
                                  child: TextFielDesign(
                                    lbltext: 'rate'.tr(context),
                                    textEditingController: bufrateController,
                                    textInputType: TextInputType.text,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    textAlign: TextAlign.right,
                                    focusNode: bufrateFocus,
                                    onSubmitted: (value) {
                                      bufaddDataRow();
                                    },
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      bufrateList.clear();
                                    });
                                  },
                                  icon: const Icon(Icons.delete),
                                  tooltip: 'Clear buf Rates',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 800,
                            child: SingleChildScrollView(
                              child: DataTable(
                                border: TableBorder.all(color: Colors.black),
                                columns: [
                                  DataColumn(
                                    label: SizedBox(
                                      width: 40,
                                      height: 20,
                                      child: Text(
                                        'fat'.tr(context),
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: SizedBox(
                                      width: 40,
                                      height: 20,
                                      child: Text(
                                        'SNF',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: SizedBox(
                                      width: 40,
                                      height: 20,
                                      child: Text(
                                        'rate'.tr(context),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                                rows: bufrateList.map((rate) {
                                  return DataRow(cells: [
                                    DataCell(
                                      SizedBox(
                                        width: 40,
                                        height: 20,
                                        child: Center(
                                          child: Text(
                                            rate["fat"] ?? "",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      SizedBox(
                                        width: 40,
                                        height: 20,
                                        child: Center(
                                          child: Text(
                                            rate["snf"] ?? "",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      SizedBox(
                                        width: 40,
                                        height: 20,
                                        child: Center(
                                          child: Text(
                                            rate["rate"] ?? "",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]);
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void cowaddDataRow() {
    if (cowfatController.text.isNotEmpty &&
        cowsnfController.text.isNotEmpty &&
        cowrateController.text.isNotEmpty) {
      setState(() {
        cowrateList.add({
          'fat': double.parse(cowfatController.text).toStringAsFixed(1),
          'snf': double.parse(cowsnfController.text).toStringAsFixed(1),
          'rate': double.parse(cowrateController.text).toStringAsFixed(2),
        });

        // Increment Fat by 0.1
        double currentFat = double.tryParse(cowfatController.text) ?? 0.0;
        currentFat += 0.1;
        cowfatController.text =
            currentFat.toStringAsFixed(1); // Update Fat field

        // Clear Rate field after adding
        cowrateController.clear();
        FocusScope.of(context).requestFocus(cowrateFocus);
      });
    }
  }

  void bufaddDataRow() {
    if (buffatController.text.isNotEmpty &&
        bufsnfController.text.isNotEmpty &&
        bufrateController.text.isNotEmpty) {
      setState(() {
        bufrateList.add({
          'fat': double.parse(buffatController.text).toStringAsFixed(1),
          'snf': double.parse(bufsnfController.text).toStringAsFixed(1),
          'rate': double.parse(bufrateController.text).toStringAsFixed(2),
        });

        // Increment Fat by 0.1
        double currentFat = double.tryParse(buffatController.text) ?? 0.0;
        currentFat += 0.1;
        buffatController.text =
            currentFat.toStringAsFixed(1); // Update Fat field

        // Clear Rate field after adding
        bufrateController.clear();
        FocusScope.of(context).requestFocus(bufrateFocus);
      });
    }
  }

  void _cowpickExcelFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      var bytes = file.readAsBytesSync();
      var excel = Excel.decodeBytes(bytes);

      // Assuming data is in the first sheet
      var sheet = excel.tables[excel.tables.keys.first];
      List<Map<String, dynamic>> cowtemplist = [];

      if (sheet != null) {
        // Extract SNF values from the first row (Header)
        var snfValues = sheet.rows.first
            .skip(1) // Skip the first column which is "SNF"
            .map((cell) => cell?.value?.toString()) // Ensure values are Strings
            .toList();

        // Extract data from rows starting from the second row

        for (var row in sheet.rows.skip(1)) {
          // Skip the header row
          for (int i = 1; i < row.length; i++) {
            // Start from the second column

            cowtemplist.add({
              'fat': row[0]?.value?.toString() ?? '', // Ensure String
              'snf': snfValues[i - 1] ?? '', // Corresponding SNF value
              'rate': row[i]?.value?.toString() ?? '', // Ensure String
            });
          }
        }

        setState(() {
          cowrateList = cowtemplist;
        });
      }
    }
  }

  void _bufpickExcelFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      var bytes = file.readAsBytesSync();
      var excel = Excel.decodeBytes(bytes);

      // Assuming data is in the first sheet
      var sheet = excel.tables[excel.tables.keys.first];
      List<Map<String, dynamic>> buftemplist = [];

      if (sheet != null) {
        // Extract SNF values from the first row (Header)
        var snfValues = sheet.rows.first
            .skip(1) // Skip the first column which is "SNF"
            .map((cell) => cell?.value?.toString()) // Ensure values are Strings
            .toList();

        // Extract data from rows starting from the second row

        for (var row in sheet.rows.skip(1)) {
          // Skip the header row
          for (int i = 1; i < row.length; i++) {
            // Start from the second column

            buftemplist.add({
              'fat': row[0]?.value?.toString() ?? '', // Ensure String
              'snf': snfValues[i - 1] ?? '', // Corresponding SNF value
              'rate': row[i]?.value?.toString() ?? '', // Ensure String
            });
          }
        }

        setState(() {
          bufrateList = buftemplist;
        });
      }
    }
  }
}
