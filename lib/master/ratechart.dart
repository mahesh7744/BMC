import 'package:bmc/customewidgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class Ratechart extends StatefulWidget {
  const Ratechart({super.key});

  @override
  State<Ratechart> createState() => _RatechartState();
}

class _RatechartState extends State<Ratechart> {
  final TextEditingController cowfatController = TextEditingController();
  final TextEditingController cowsnfController = TextEditingController();
  final TextEditingController cowrateController = TextEditingController();

  final TextEditingController buffatController = TextEditingController();
  final TextEditingController bufsnfController = TextEditingController();
  final TextEditingController bufrateController = TextEditingController();

  List<Map<String, String>> cowrateList = [];

  List<Map<String, String>> bufrateList = [];

  // Focus nodes for handling focus transitions
  FocusNode cowfatFocus = FocusNode();
  FocusNode cowsnfFocus = FocusNode();
  FocusNode cowrateFocus = FocusNode();

  FocusNode buffatFocus = FocusNode();
  FocusNode bufsnfFocus = FocusNode();
  FocusNode bufrateFocus = FocusNode();

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
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(height: 20),
                Container(
                  height: 500,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 400,
                        child: Column(
                          children: [
                            Text(
                              'Cow',
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
                                    textEditingController: cowfatController,
                                    textInputType: TextInputType.text,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    textAlign: TextAlign.left,
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
                                    textAlign: TextAlign.left,
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
                                    textAlign: TextAlign.left,
                                    focusNode: cowrateFocus,
                                    onSubmitted: (value) {
                                      cowaddDataRow();
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Column(
                              children: [],
                            ),
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
                                      DataCell(Text(rate["fat"] ?? "")),
                                      DataCell(Text(rate["snf"] ?? "")),
                                      DataCell(Text(rate["rate"] ?? "")),
                                    ]);
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        height: 400,
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
                                    textAlign: TextAlign.left,
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
                                    textAlign: TextAlign.left,
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
                                    textAlign: TextAlign.left,
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
                                  rows: bufrateList.map((rate) {
                                    return DataRow(cells: [
                                      DataCell(Text(rate["fat"] ?? "")),
                                      DataCell(Text(rate["snf"] ?? "")),
                                      DataCell(Text(rate["rate"] ?? "")),
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
}
