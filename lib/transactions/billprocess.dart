import 'package:bmc/customewidgets/custom_button.dart';
import 'package:bmc/customewidgets/custom_textfield.dart';
import 'package:bmc/customewidgets/date_widget.dart';
import 'package:bmc/other/app_localizations.dart';
import 'package:bmc/other/globaldata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Billprocess extends StatefulWidget {
  const Billprocess({super.key});

  @override
  State<Billprocess> createState() => _BillprocessState();
}

class _BillprocessState extends State<Billprocess> {
  TextEditingController trscDateController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController cowlitterController = TextEditingController();
  TextEditingController cowamountController = TextEditingController();
  TextEditingController cowcommisionontroller = TextEditingController();
  TextEditingController buffalolitterController = TextEditingController();
  TextEditingController buffaloamountController = TextEditingController();
  TextEditingController buffalocommisionontroller = TextEditingController();
  TextEditingController totallitterController = TextEditingController();
  TextEditingController totalamountController = TextEditingController();
  TextEditingController totalcommisionontroller = TextEditingController();
  TextEditingController advancepriviousController = TextEditingController();
  TextEditingController advancereciptController = TextEditingController();
  TextEditingController advancebilladvanceController = TextEditingController();
  TextEditingController advancelessController = TextEditingController();
  TextEditingController advancebalanceController = TextEditingController();
  TextEditingController canpriviousController = TextEditingController();
  TextEditingController canreciptController = TextEditingController();
  TextEditingController canbilladvanceController = TextEditingController();
  TextEditingController canlessController = TextEditingController();
  TextEditingController canbalanceController = TextEditingController();
  TextEditingController cattlefeedpriviousController = TextEditingController();
  TextEditingController cattlefeedreciptController = TextEditingController();
  TextEditingController cattlefeedbilladvanceController =
      TextEditingController();
  TextEditingController cattlefeedlessController = TextEditingController();
  TextEditingController cattlefeedbalanceController = TextEditingController();
  TextEditingController softwarechargespriviousController =
      TextEditingController();
  TextEditingController softwarechargesreciptController =
      TextEditingController();
  TextEditingController softwarechargesbilladvanceController =
      TextEditingController();
  TextEditingController softwarechargeslessController = TextEditingController();
  TextEditingController softwarechargesbalanceController =
      TextEditingController();
  TextEditingController doctorvisitpriviousController = TextEditingController();
  TextEditingController doctorvisitreciptController = TextEditingController();
  TextEditingController doctorvisitbilladvanceController =
      TextEditingController();
  TextEditingController doctorvisitlessController = TextEditingController();
  TextEditingController doctorvisitbalanceController = TextEditingController();
  TextEditingController otherpriviousController = TextEditingController();
  TextEditingController otherreciptController = TextEditingController();
  TextEditingController otherbilladvanceController = TextEditingController();
  TextEditingController otherlessController = TextEditingController();
  TextEditingController otherbalanceController = TextEditingController();
  TextEditingController fixlessController = TextEditingController();
  TextEditingController cowdeplessController = TextEditingController();
  TextEditingController bufdeplessController = TextEditingController();
  TextEditingController gunptrController = TextEditingController();
  TextEditingController sumulpayController = TextEditingController();
  TextEditingController otherpayController = TextEditingController();
  TextEditingController clearpayController = TextEditingController();
  TextEditingController tcsController = TextEditingController();

  String? selectedRootName;

  List<String> rootNames = ['Aniket', 'Suresh', 'Meena', 'Ramesh'];

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
          'billprocess'.tr(context),
          style: TextStyle(
            fontSize: 24,
            fontFamily: GlobalData.fontname,
            color: Color.fromARGB(255, 58, 245, 226),
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 1000,
            height: 800,
            color: Color.fromARGB(255, 190, 204, 236),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  SizedBox(height: 45),
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
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
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
                      SizedBox(width: 20),
                      CustomButton(
                        width: 100,
                        height: 40,
                        text: 'process'.tr(context),
                        icon: Icons.receipt_long,
                        onPressed: () {
                          // addToTable(); // हे महत्त्वाचं!
                        },
                        onSubmitted: (value) {
                          // FocusScope.of(context).requestFocus(societyCodeFocus); // हवं असल्यास
                        },
                      ),
                      SizedBox(width: 40),
                      SizedBox(
                        width: 400, // इथे तुमच्या आवश्यकतेनुसार width ठेवा
                        child: DropdownButtonFormField<String>(
                          value: selectedRootName,
                          decoration: InputDecoration(
                            labelText: 'rootname'.tr(context),
                            labelStyle:
                                TextStyle(fontFamily: GlobalData.fontname),
                            border: OutlineInputBorder(),
                          ),
                          items: rootNames.map((name) {
                            return DropdownMenuItem(
                              value: name,
                              child: Text(name),
                            );
                          }).toList(),
                          onChanged: (value) {
                            selectedRootName = value;
                            // जर StatefulWidget असेल तर setState() वापरा
                          },
                        ),
                      )
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
                      SizedBox(width: 23),
                      SizedBox(
                        height: 50,
                        width: 120,
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
                        width: 120,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: Row(
                      children: [
                        Text(
                          'litter'.tr(context),
                          style: TextStyle(
                              fontSize: 16, fontFamily: GlobalData.fontname),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text('amount'.tr(context),
                            style: TextStyle(
                                fontSize: 16, fontFamily: GlobalData.fontname)),
                        SizedBox(width: 40),
                        Text('commision'.tr(context),
                            style: TextStyle(
                                fontSize: 16, fontFamily: GlobalData.fontname)),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Container(
                          width: 60,
                          // color: Colors.redAccent,
                          alignment: Alignment.center,
                          child: Text(
                            'cow'.tr(context),
                            style: TextStyle(
                                fontSize: 16, fontFamily: GlobalData.fontname),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 40,
                        width: 90,
                        child: TextFielDesign(
                          lbltext: '',
                          textEditingController: cowlitterController,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: TextFielDesign(
                          lbltext: '',
                          textEditingController: cowamountController,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: TextFielDesign(
                          lbltext: '',
                          textEditingController: cowcommisionontroller,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                        ),
                      ),
                      SizedBox(width: 150),
                      SizedBox(
                        width: 120,
                        height: 40,
                        child: CustomButton(
                          text: 'billinmarthi'.tr(context),
                          icon: Icons.save,
                          onPressed: () {
                            // addToTable(); // हे महत्त्वाचं!
                          },
                          onSubmitted: (value) {
                            // FocusScope.of(context).requestFocus(societyCodeFocus); // हवं असल्यास
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        width: 130,
                        height: 40,
                        child: CustomButton(
                          text: 'billinenglish'.tr(context),
                          icon: Icons.save,
                          onPressed: () {
                            // addToTable(); // हे महत्त्वाचं!
                          },
                          onSubmitted: (value) {
                            // FocusScope.of(context).requestFocus(societyCodeFocus); // हवं असल्यास
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Container(
                          width: 60,
                          // color: Colors.redAccent,
                          alignment: Alignment.center,
                          child: Text(
                            'buffalo'.tr(context),
                            style: TextStyle(
                                fontSize: 16, fontFamily: GlobalData.fontname),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 40,
                        width: 90,
                        child: TextFielDesign(
                          lbltext: '',
                          textEditingController: buffalolitterController,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: TextFielDesign(
                          lbltext: '',
                          textEditingController: buffaloamountController,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: TextFielDesign(
                          lbltext: '',
                          textEditingController: buffalocommisionontroller,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                        ),
                      ),
                      SizedBox(width: 150),
                      SizedBox(
                        width: 160,
                        height: 40,
                        child: CustomButton(
                          text: 'milkbillstatement'.tr(context),
                          icon: Icons.save,
                          onPressed: () {
                            // addToTable(); // हे महत्त्वाचं!
                          },
                          onSubmitted: (value) {
                            // FocusScope.of(context).requestFocus(societyCodeFocus); // हवं असल्यास
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        width: 120,
                        height: 40,
                        child: CustomButton(
                          text: 'bankreport'.tr(context),
                          icon: Icons.save,
                          onPressed: () {
                            // addToTable(); // हे महत्त्वाचं!
                          },
                          onSubmitted: (value) {
                            // FocusScope.of(context).requestFocus(societyCodeFocus); // हवं असल्यास
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        width: 150,
                        height: 40,
                        child: CustomButton(
                          text: 'paymentregister'.tr(context),
                          icon: Icons.save,
                          onPressed: () {
                            // addToTable();
                          },
                          onSubmitted: (value) {
                            // FocusScope.of(context).requestFocus(societyCodeFocus);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Container(
                          width: 60,
                          // color: Colors.redAccent,
                          alignment: Alignment.center,
                          child: Text(
                            'total'.tr(context),
                            style: TextStyle(
                                fontSize: 16, fontFamily: GlobalData.fontname),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 40,
                        width: 90,
                        child: TextFielDesign(
                          lbltext: '',
                          textEditingController: totallitterController,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: TextFielDesign(
                          lbltext: '',
                          textEditingController: totalamountController,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: TextFielDesign(
                          lbltext: '',
                          textEditingController: totalcommisionontroller,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 160),
                    child: Row(
                      children: [
                        Text(
                          'privious',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text('receipt', style: TextStyle(fontSize: 16)),
                        SizedBox(width: 40),
                        Text('billadvance', style: TextStyle(fontSize: 16)),
                        SizedBox(width: 50),
                        Text('less', style: TextStyle(fontSize: 16)),
                        SizedBox(width: 60),
                        Text('balance', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Container(
                          width: 130,
                          // color: Colors.redAccent,
                          alignment: Alignment.center,
                          child: Text(
                            'advance',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 40,
                        width: 90,
                        child: TextFielDesign(
                          lbltext: '',
                          textEditingController: advancepriviousController,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: TextFielDesign(
                          lbltext: '',
                          textEditingController: advancereciptController,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: TextFielDesign(
                          lbltext: '',
                          textEditingController: advancebilladvanceController,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: TextFielDesign(
                          lbltext: '',
                          textEditingController: advancelessController,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: TextFielDesign(
                          lbltext: '',
                          textEditingController: advancebalanceController,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                        ),
                      ),
                      SizedBox(width: 140),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: TextFielDesign(
                          lbltext: 'fixless',
                          textEditingController: fixlessController,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Container(
                          width: 130,
                          // color: Colors.redAccent,
                          alignment: Alignment.center,
                          child: Text(
                            'can',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 40,
                        width: 90,
                        child: TextFielDesign(
                          lbltext: '',
                          textEditingController: canpriviousController,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: TextFielDesign(
                          lbltext: '',
                          textEditingController: canreciptController,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: TextFielDesign(
                          lbltext: '',
                          textEditingController: canbilladvanceController,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: TextFielDesign(
                          lbltext: '',
                          textEditingController: canlessController,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: TextFielDesign(
                          lbltext: '',
                          textEditingController: canbalanceController,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                        ),
                      ),
                      SizedBox(width: 60),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: TextFielDesign(
                          lbltext: 'cowdepless',
                          textEditingController: cowdeplessController,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                        ),
                      ),
                      SizedBox(width: 50),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: TextFielDesign(
                          lbltext: 'buffalodepless',
                          textEditingController: bufdeplessController,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Container(
                          width: 130,
                          // color: Colors.redAccent,
                          alignment: Alignment.center,
                          child: Text(
                            'cattlefeed',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 40,
                        width: 90,
                        child: TextFielDesign(
                          lbltext: '',
                          textEditingController: cattlefeedpriviousController,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: TextFielDesign(
                          lbltext: '',
                          textEditingController: cattlefeedreciptController,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: TextFielDesign(
                          lbltext: '',
                          textEditingController:
                              cattlefeedbilladvanceController,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: TextFielDesign(
                          lbltext: '',
                          textEditingController: cattlefeedlessController,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: TextFielDesign(
                          lbltext: '',
                          textEditingController: cattlefeedbalanceController,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                        ),
                      ),
                      SizedBox(width: 60),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: TextFielDesign(
                          lbltext: 'gunpatr',
                          textEditingController: gunptrController,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                        ),
                      ),
                      SizedBox(width: 50),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: TextFielDesign(
                          lbltext: 'sumulpay',
                          textEditingController: sumulpayController,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Container(
                          width: 130,
                          // color: Colors.redAccent,
                          alignment: Alignment.center,
                          child: Text(
                            'softwarecharges',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 40,
                        width: 90,
                        child: TextFielDesign(
                          lbltext: '',
                          textEditingController:
                              softwarechargespriviousController,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: TextFielDesign(
                          lbltext: '',
                          textEditingController:
                              softwarechargesreciptController,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: TextFielDesign(
                          lbltext: '',
                          textEditingController:
                              softwarechargesbilladvanceController,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: TextFielDesign(
                          lbltext: '',
                          textEditingController: softwarechargeslessController,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: TextFielDesign(
                          lbltext: '',
                          textEditingController:
                              softwarechargesbalanceController,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                        ),
                      ),
                      SizedBox(width: 60),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: TextFielDesign(
                          lbltext: 'otherpay',
                          textEditingController: otherpayController,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                        ),
                      ),
                      SizedBox(width: 50),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: TextFielDesign(
                          lbltext: 'clearpayamount',
                          textEditingController: clearpayController,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Container(
                          width: 130,
                          // color: Colors.redAccent,
                          alignment: Alignment.center,
                          child: Text(
                            'doctorvisit',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 40,
                        width: 90,
                        child: TextFielDesign(
                          lbltext: '',
                          textEditingController: doctorvisitpriviousController,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: TextFielDesign(
                          lbltext: '',
                          textEditingController: doctorvisitreciptController,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: TextFielDesign(
                          lbltext: '',
                          textEditingController:
                              doctorvisitbilladvanceController,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: TextFielDesign(
                          lbltext: '',
                          textEditingController: doctorvisitlessController,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: TextFielDesign(
                          lbltext: '',
                          textEditingController: doctorvisitbalanceController,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                        ),
                      ),
                      SizedBox(width: 60),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: TextFielDesign(
                          lbltext: 'tcs',
                          textEditingController: tcsController,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Container(
                          width: 130,
                          // color: Colors.redAccent,
                          alignment: Alignment.center,
                          child: Text(
                            'other',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 40,
                        width: 90,
                        child: TextFielDesign(
                          lbltext: '',
                          textEditingController: otherpriviousController,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: TextFielDesign(
                          lbltext: '',
                          textEditingController: otherreciptController,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: TextFielDesign(
                          lbltext: '',
                          textEditingController: otherbilladvanceController,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: TextFielDesign(
                          lbltext: '',
                          textEditingController: otherlessController,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: TextFielDesign(
                          lbltext: '',
                          textEditingController: otherbalanceController,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 100,
                          height: 40,
                          child: CustomButton(
                            text: 'save',
                            icon: Icons.save,
                            onPressed: () {
                              // addToTable(); // हे महत्त्वाचं!
                            },
                            onSubmitted: (value) {
                              // FocusScope.of(context).requestFocus(societyCodeFocus); // हवं असल्यास
                            },
                          ),
                        ),
                        SizedBox(width: 10),
                        SizedBox(
                          width: 100,
                          height: 40,
                          child: CustomButton(
                            text: 'delete',
                            icon: Icons.delete,
                            onPressed: () {
                              // addToTable(); // हे महत्त्वाचं!
                            },
                            onSubmitted: (value) {
                              // FocusScope.of(context).requestFocus(societyCodeFocus); // हवं असल्यास
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
