import 'package:bmc/other/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:bmc/customewidgets/custom_button.dart';
import 'package:bmc/customewidgets/custom_textfield.dart';

class Rootmaster extends StatefulWidget {
  const Rootmaster({super.key});

  @override
  State<Rootmaster> createState() => _RootmasterState();
}

class _RootmasterState extends State<Rootmaster> {
  TextEditingController rootcodeController = TextEditingController();
  TextEditingController rootnameController = TextEditingController();

  FocusNode rootcodeFocus = FocusNode();
  FocusNode rootnameFocus = FocusNode();
  FocusNode saveFocus = FocusNode();

  @override
  void dispose() {
    // FocusNode dispose करणे आवश्यक आहे
    rootcodeFocus.dispose();
    rootnameFocus.dispose();
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
          'rootmaster'.tr(context),
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'Roboto',
            color: Color.fromARGB(255, 58, 245, 226),
          ),
        ),
      ),
      body: SafeArea(
          child: Center(
        child: Container(
          width: 300,
          child: Column(
            children: [
              SizedBox(height: 20),
              SizedBox(
                height: 60,
                width: 100,
                child: TextFielDesign(
                  lbltext: 'rootcode'.tr(context),
                  textEditingController: rootcodeController,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.left,
                  textInputType: TextInputType.text,
                  focusNode: rootcodeFocus,
                  onSubmitted: (value) {
                    FocusScope.of(context).requestFocus(rootnameFocus);
                  },
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 60,
                width: 400,
                child: TextFielDesign(
                  lbltext: 'rootname'.tr(context),
                  textEditingController: rootnameController,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.left,
                  textInputType: TextInputType.text,
                  focusNode: rootnameFocus,
                  onSubmitted: (value) {
                    FocusScope.of(context).requestFocus(saveFocus);
                  },
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    width: 90,
                    height: 40,
                    text: 'delete'.tr(context),
                    icon: Icons.delete,
                    onPressed: () {},
                  ),
                  SizedBox(width: 20),
                  CustomButton(
                    width: 90,
                    height: 40,
                    text: 'save'.tr(context),
                    focusNode: saveFocus,
                    icon: Icons.save,
                    onPressed: () {
                      FocusScope.of(context).requestFocus(rootcodeFocus);
                    },
                    onSubmitted: (value) {
                      FocusScope.of(context).requestFocus(rootcodeFocus);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
