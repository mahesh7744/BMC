import 'package:flutter/material.dart';
import 'package:bmc/customewidgets/custom_textfield.dart';
import 'package:flutter/services.dart';
import 'package:bmc/customewidgets/custom_button.dart';

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
          'Cattle Feed Master',
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
                    lbltext: 'Cattle feed Name',
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
                    lbltext: 'Packing',
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
                    lbltext: 'Sale Rate',
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
                    lbltext: 'Purchase Rate',
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
                    lbltext: 'Opening Stock',
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
                        FocusScope.of(context)
                            .requestFocus(cattlefeednameFocus);
                      },
                      onSubmitted: (value) {
                        FocusScope.of(context)
                            .requestFocus(cattlefeednameFocus);
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
