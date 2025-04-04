import 'dart:io';

import 'package:bmc/customewidgets/custom_textfield.dart';
import 'package:bmc/customewidgets/date_widget.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class Ratechart extends StatefulWidget {
  const Ratechart({super.key});

  @override
  State<Ratechart> createState() => _RatechartState();
}

class _RatechartState extends State<Ratechart> {
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
        title: const Text(
          'Rate Chart',
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
              Row(
                children: [
                  SizedBox(
                    height: 60,
                    width: 160,
                    child: DatePickerField(
                      controller: trscDateController,
                      labelText: 'Select Date',
                    ),
                  ),
                  SizedBox(width: 10),
                  SizedBox(
                    height: 60,
                    width: 220,
                    child: TextFielDesign(
                      lbltext: 'Chart name',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      _cowpickExcelFile();
                    },
                    icon: Icon(Icons.add, color: Colors.white),
                    label: Text("Cow form Excel",
                        style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      _bufpickExcelFile();
                    },
                    icon: Icon(Icons.add, color: Colors.white),
                    label: Text("Buffalo form excel",
                        style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 500,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 10),
                    Container(
                      height: 450,
                      child: Column(
                        children: [
                          Text(
                            'Cow',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 16,
                              color: Colors.indigoAccent.shade200,
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              SizedBox(
                                width: 120,
                                child: TextFielDesign(
                                  lbltext: 'Fat',
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
                                width: 120,
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
                                width: 120,
                                child: TextFielDesign(
                                  lbltext: 'Rate',
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
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 300,
                            child: SingleChildScrollView(
                              child: DataTable(
                                columnSpacing: 10,
                                border: TableBorder.all(color: Colors.black),
                                columns: [
                                  DataColumn(
                                    label: SizedBox(
                                      width: 100,
                                      child: Text(
                                        'Fat',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: SizedBox(
                                      width: 100,
                                      child: Text(
                                        'SNF',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: SizedBox(
                                      width: 100,
                                      child: Text(
                                        'Rate',
                                        style: TextStyle(
                                            fontSize: 16,
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
                                        width: 100,
                                        child: Center(
                                          child: Text(
                                            rate["fat"] ?? "",
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      SizedBox(
                                        width: 100,
                                        child: Center(
                                          child: Text(
                                            rate["snf"] ?? "",
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      SizedBox(
                                        width: 100,
                                        child: Center(
                                          child: Text(
                                            rate["rate"] ?? "",
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]);
                                }).toList(),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    cowrateList.clear();
                                  });
                                },
                                icon: const Icon(Icons.delete),
                                tooltip: 'Clear Cow Rates',
                              ),
                              Text('Delete Row'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 40),
                    Container(
                      height: 450,
                      child: Column(
                        children: [
                          Text(
                            'Buffalo',
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 16,
                                color: Colors.indigoAccent.shade200),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              SizedBox(
                                width: 120,
                                child: TextFielDesign(
                                  lbltext: 'Fat',
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
                                width: 120,
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
                                width: 120,
                                child: TextFielDesign(
                                  lbltext: 'Rate',
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
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 300,
                            child: SingleChildScrollView(
                              child: DataTable(
                                columnSpacing: 10,
                                border: TableBorder.all(color: Colors.black),
                                columns: [
                                  DataColumn(
                                    label: SizedBox(
                                      width: 100,
                                      child: Text(
                                        'Fat',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: SizedBox(
                                      width: 100,
                                      child: Text(
                                        'SNF',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: SizedBox(
                                      width: 100,
                                      child: Text(
                                        'Rate',
                                        style: TextStyle(
                                            fontSize: 16,
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
                                        width: 100,
                                        child: Center(
                                          child: Text(
                                            rate["fat"] ?? "",
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      SizedBox(
                                        width: 100,
                                        child: Center(
                                          child: Text(
                                            rate["snf"] ?? "",
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      SizedBox(
                                        width: 100,
                                        child: Center(
                                          child: Text(
                                            rate["rate"] ?? "",
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]);
                                }).toList(),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    bufrateList.clear();
                                  });
                                },
                                icon: const Icon(Icons.delete),
                                tooltip: 'Clear Cow Rates',
                              ),
                              Text('Delete Row'),
                            ],
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
          'fat': cowfatController.text,
          'snf': cowsnfController.text,
          'rate': cowrateController.text,
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
          'fat': buffatController.text,
          'snf': bufsnfController.text,
          'rate': bufrateController.text,
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
