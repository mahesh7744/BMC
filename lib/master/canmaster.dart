import 'package:bmc/other/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:bmc/customewidgets/custom_textfield.dart';
import 'package:flutter/services.dart';
import 'package:bmc/customewidgets/custom_button.dart';

class Canmaster extends StatefulWidget {
  const Canmaster({super.key});

  @override
  State<Canmaster> createState() => _CanmasterState();
}

class _CanmasterState extends State<Canmaster> {
  TextEditingController canController = TextEditingController();
  TextEditingController purchaserateController = TextEditingController();
  TextEditingController salerateController = TextEditingController();
  TextEditingController openingstockController = TextEditingController();
  TextEditingController gstController = TextEditingController();

  FocusNode canFocus = FocusNode();
  FocusNode purchaserateFocus = FocusNode();
  FocusNode salerateFocus = FocusNode();
  FocusNode openingstockFocus = FocusNode();
  FocusNode gstFocus = FocusNode();
  FocusNode saveFocus = FocusNode();

  @override
  void dispose() {
    // FocusNode dispose करणे आवश्यक आहे

    canFocus.dispose();
    purchaserateFocus.dispose();
    salerateFocus.dispose();
    openingstockFocus.dispose();
    gstFocus.dispose();
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
        title: Text(
          'canmaster'.tr(context),
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
                SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  width: 300,
                  child: TextFielDesign(
                    lbltext: 'cantype'.tr(context),
                    textEditingController: canController,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.left,
                    textInputType: TextInputType.text,
                    focusNode: canFocus,
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
                    textInputType: TextInputType.text,
                    focusNode: purchaserateFocus,
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
                    textInputType: TextInputType.text,
                    // prefixIcon: Icons.mobile_friendly,
                    focusNode: salerateFocus,
                    onSubmitted: (value) {
                      FocusScope.of(context).requestFocus(openingstockFocus);
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
                    textInputType: TextInputType.text,
                    // prefixIcon: Icons.location_on,
                    focusNode: openingstockFocus,
                    onSubmitted: (value) {
                      FocusScope.of(context).requestFocus(gstFocus);
                    },
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  width: 150,
                  child: TextFielDesign(
                    lbltext: 'GST',
                    textEditingController: gstController,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.left,
                    textInputType: TextInputType.text,
                    // prefixIcon: Icons.location_on,
                    focusNode: gstFocus,
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
                      onPressed: () {
                        FocusScope.of(context).requestFocus(canFocus);
                      },
                      onSubmitted: (value) {
                        FocusScope.of(context).requestFocus(canFocus);
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
