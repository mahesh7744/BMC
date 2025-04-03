import 'package:bmc/customewidgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class Ratechart extends StatefulWidget {
  const Ratechart({super.key});

  @override
  State<Ratechart> createState() => _RatechartState();
}

class _RatechartState extends State<Ratechart> {
  final TextEditingController fatController = TextEditingController();
  final TextEditingController snfController = TextEditingController();
  final TextEditingController rateController = TextEditingController();

  List<Map<String, String>> rateList = [];

  // Focus nodes for handling focus transitions
  FocusNode fatFocus = FocusNode();
  FocusNode snfFocus = FocusNode();
  FocusNode rateFocus = FocusNode();

  void addToTable() {
    if (fatController.text.isNotEmpty &&
        snfController.text.isNotEmpty &&
        rateController.text.isNotEmpty) {
      setState(() {
        rateList.add({
          "fat": fatController.text,
          "snf": snfController.text,
          "rate": rateController.text,
        });

        // Clear text fields after submission
        fatController.clear();
        snfController.clear();
        rateController.clear();

        // Move focus back to the first field
        FocusScope.of(context).requestFocus(fatFocus);
      });
    }
  }

  @override
  void dispose() {
    // Dispose of focus nodes to avoid memory leaks
    fatFocus.dispose();
    snfFocus.dispose();
    rateFocus.dispose();
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
                Row(
                  children: [
                    SizedBox(
                      width: 120,
                      child: TextFielDesign(
                        lbltext: 'Fat',
                        textEditingController: fatController,
                        textInputType: TextInputType.text,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.left,
                        focusNode: fatFocus,
                        onSubmitted: (value) {
                          FocusScope.of(context).requestFocus(snfFocus);
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      width: 120,
                      child: TextFielDesign(
                        lbltext: 'SNF',
                        textEditingController: snfController,
                        textInputType: TextInputType.text,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.left,
                        focusNode: snfFocus,
                        onSubmitted: (value) {
                          FocusScope.of(context).requestFocus(rateFocus);
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      width: 120,
                      child: TextFielDesign(
                        lbltext: 'Rate',
                        textEditingController: rateController,
                        textInputType: TextInputType.text,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.left,
                        focusNode: rateFocus,
                        onSubmitted: (value) {
                          addToTable();
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columnSpacing: 20,
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
                          rows: rateList.map((rate) {
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
