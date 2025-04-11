import 'dart:convert';

import 'package:bmc/other/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:bmc/customewidgets/custom_textfield.dart';
import 'package:flutter/services.dart';
import 'package:bmc/customewidgets/custom_button.dart';
import 'package:http/http.dart' as http;

class Cattlefeedmaster extends StatefulWidget {
  const Cattlefeedmaster({super.key});

  @override
  State<Cattlefeedmaster> createState() => _CattlefeedmasterState();
}

class _CattlefeedmasterState extends State<Cattlefeedmaster> {
  TextEditingController cattlefeednameController = TextEditingController();
  TextEditingController packingController = TextEditingController();
  TextEditingController gstController = TextEditingController();
  TextEditingController salerateController = TextEditingController();
  TextEditingController purchaserateController = TextEditingController();
  TextEditingController openingstockController = TextEditingController();

  FocusNode cattlefeednameFocus = FocusNode();
  FocusNode packingFocus = FocusNode();
  FocusNode gstFocus = FocusNode();
  FocusNode salerateFocus = FocusNode();
  FocusNode purchaserateFocus = FocusNode();
  FocusNode oprningstockFocus = FocusNode();
  FocusNode saveFocus = FocusNode();

  @override
  void dispose() {
    // FocusNode dispose करणे आवश्यक आहे
    cattlefeednameController.dispose();
    packingFocus.dispose();
    gstFocus.dispose();
    salerateFocus.dispose();
    purchaserateFocus.dispose();
    oprningstockFocus.dispose();
    saveFocus.dispose();

    super.dispose();
  }

  Future<void> insertItemMaster(
      Map<String, dynamic> itemData, String dbName) async {
    final response = await http.post(
      Uri.parse('http://192.168.1.5:5000/itemmaster/add'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'db': dbName, // ✅ इथे variable पासून string पाठवत आहोत
        ...itemData,
      }),
    );

    if (response.statusCode == 200) {
      print('Item inserted successfully');
    } else {
      print('Failed to insert: ${response.body}');
    }
  }

  List<Map<String, dynamic>> itemList = [];

  Future<void> fetchItems() async {
    final dbName = 'bmc1'; // इथे तुम्ही client नुसार dynamic change करू शकता
    final url = Uri.parse('http://192.168.1.5:5000/itemmaster/all?db=$dbName');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      setState(() {
        itemList = List<Map<String, dynamic>>.from(data);
      });
    } else {
      print('Failed to load items: ${response.body}');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchItems();
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
          'cattlefeedmaster'.tr(context),
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
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  width: 300,
                  child: TextFielDesign(
                    lbltext: 'cattlefeedname'.tr(context),
                    textEditingController: cattlefeednameController,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.left,
                    textInputType: TextInputType.text,
                    focusNode: cattlefeednameFocus,
                    onSubmitted: (value) {
                      FocusScope.of(context).requestFocus(packingFocus);
                    },
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  width: 150,
                  child: TextFielDesign(
                    lbltext: 'packing'.tr(context),
                    textEditingController: packingController,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.left,
                    textInputType: TextInputType.text,
                    //  prefixIcon: Icon(Icons.inventory),
                    focusNode: packingFocus,
                    onSubmitted: (value) {
                      FocusScope.of(context).requestFocus(gstFocus);
                    },
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  width: 100,
                  child: TextFielDesign(
                    lbltext: 'GST',
                    textEditingController: gstController,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                    textInputType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d*\.?\d{0,2}'))
                    ],
                    focusNode: gstFocus,
                    onSubmitted: (value) {
                      FocusScope.of(context).requestFocus(salerateFocus);
                    },
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  width: 150,
                  child: TextFielDesign(
                    lbltext: 'salerate'.tr(context),
                    textEditingController: salerateController,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                    textInputType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d*\.?\d{0,2}'))
                    ],
                    // prefixIcon: Icons.location_on,
                    focusNode: salerateFocus,
                    onSubmitted: (value) {
                      FocusScope.of(context).requestFocus(purchaserateFocus);
                    },
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  width: 150,
                  child: TextFielDesign(
                    lbltext: 'purchaserate'.tr(context),
                    textEditingController: purchaserateController,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                    textInputType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d*\.?\d{0,2}'))
                    ],
                    // prefixIcon: Icons.location_on,
                    focusNode: purchaserateFocus,
                    onSubmitted: (value) {
                      FocusScope.of(context).requestFocus(oprningstockFocus);
                    },
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  width: 150,
                  child: TextFielDesign(
                    lbltext: 'openingstock'.tr(context),
                    textEditingController: openingstockController,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                    textInputType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d*\.?\d{0,2}'))
                    ],
                    // prefixIcon: Icons.location_on,
                    focusNode: oprningstockFocus,
                    onSubmitted: (value) {
                      FocusScope.of(context).requestFocus(saveFocus);
                    },
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomButton(
                      width: 100,
                      height: 40,
                      text: 'delete'.tr(context),
                      icon: Icons.delete,
                      onPressed: () {},
                    ),
                    SizedBox(width: 20),
                    CustomButton(
                      width: 100,
                      height: 40,
                      text: 'save'.tr(context),
                      focusNode: saveFocus,
                      icon: Icons.save,
                      onPressed: () async {
                        FocusScope.of(context).unfocus(); // keyboard hide

                        // await insertItemMaster({
                        //   "ItemName": cattlefeednameController.text.trim(),
                        //   "Packing": packingController.text.trim(),
                        //   "Gst": double.tryParse(gstController.text) ?? 0,
                        //   "SaleRate":
                        //       double.tryParse(salerateController.text) ?? 0,
                        //   "PurchaseRate":
                        //       double.tryParse(purchaserateController.text) ?? 0,
                        //   "OpeningStock":
                        //       double.tryParse(openingstockController.text) ?? 0,
                        // });

                        insertItemMaster({
                          'ItemName': 'Pen',
                          'Packing': 'Box',
                          'Gst': 12,
                          'SaleRate': 15,
                          'PurchaseRate': 10,
                          'OpeningStock': 50,
                        }, 'bmc1'); // 👈 Flutter मधून इथे 'bmc1' database पाठवत आहोत

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  'Hardcoded Item inserted successfully!')),
                        );
                      },
                      onSubmitted: (value) {
                        FocusScope.of(context)
                            .requestFocus(cattlefeednameFocus);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Item List',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.all(8),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columnSpacing: 30, // space between columns
                      headingRowColor: WidgetStateProperty.all(
                          Colors.indigo.shade100), // header bg
                      columns: const [
                        DataColumn(
                            label: SizedBox(width: 100, child: Text('Item'))),
                        DataColumn(
                            label: SizedBox(width: 80, child: Text('Packing'))),
                        DataColumn(
                            label: SizedBox(width: 60, child: Text('GST'))),
                        DataColumn(
                            label:
                                SizedBox(width: 80, child: Text('Sale Rate'))),
                        DataColumn(
                            label: SizedBox(
                                width: 100, child: Text('Purchase Rate'))),
                        DataColumn(
                            label: SizedBox(
                                width: 100, child: Text('Opening Stock'))),
                      ],
                      rows: itemList.map((item) {
                        return DataRow(cells: [
                          DataCell(Text(item['ItemName'].toString())),
                          DataCell(Text(item['Packing'].toString())),
                          DataCell(Text(item['Gst'].toString())),
                          DataCell(Text(item['SaleRate'].toString())),
                          DataCell(Text(item['PurchaseRate'].toString())),
                          DataCell(Text(item['OpeningStock'].toString())),
                        ]);
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
