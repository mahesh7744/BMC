import 'package:flutter/material.dart';
import 'package:bmc/customewidgets/custom_textfield.dart';
import 'package:flutter/services.dart';
import 'package:bmc/customewidgets/custom_button.dart';

class Transportmaster extends StatefulWidget {
  const Transportmaster({super.key});

  @override
  State<Transportmaster> createState() => _TransportmasterState();
}

class _TransportmasterState extends State<Transportmaster> {
  TextEditingController codeController = TextEditingController();
  TextEditingController drivernameController = TextEditingController();
  TextEditingController mobilenumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController vehicleController = TextEditingController();
  TextEditingController vehiclenumberController = TextEditingController();
  TextEditingController kmController = TextEditingController();
  TextEditingController fixrateController = TextEditingController();

  FocusNode codeFocus = FocusNode();
  FocusNode drivernameFocus = FocusNode();
  FocusNode mobilenumberFocus = FocusNode();
  FocusNode addressFocus = FocusNode();
  FocusNode vehicleFocus = FocusNode();
  FocusNode vehicenumberFocus = FocusNode();
  FocusNode kmFocus = FocusNode();
  FocusNode fixrateFocus = FocusNode();
  FocusNode saveFocus = FocusNode();

  @override
  void dispose() {
    // FocusNode dispose करणे आवश्यक आहे

    codeFocus.dispose();
    drivernameFocus.dispose();
    addressFocus.dispose();
    mobilenumberFocus.dispose();
    vehicleFocus.dispose();
    vehicenumberFocus.dispose();
    kmFocus.dispose();
    fixrateFocus.dispose();
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
          'Transposrt Master',
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
                  width: 150,
                  child: TextFielDesign(
                    lbltext: 'Code',
                    textEditingController: codeController,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                    textInputType: TextInputType.text,
                    focusNode: codeFocus,
                    onSubmitted: (value) {
                      FocusScope.of(context).requestFocus(drivernameFocus);
                    },
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  width: 300,
                  child: TextFielDesign(
                    lbltext: 'Driver Name',
                    textEditingController: drivernameController,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.left,
                    textInputType: TextInputType.text,
                    focusNode: drivernameFocus,
                    onSubmitted: (value) {
                      FocusScope.of(context).requestFocus(mobilenumberFocus);
                    },
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  width: 200,
                  child: TextFielDesign(
                    lbltext: 'Mobile No',
                    textEditingController: mobilenumberController,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.left,
                    textInputType: TextInputType.text,
                    prefixIcon: Icons.mobile_friendly,
                    focusNode: mobilenumberFocus,
                    onSubmitted: (value) {
                      FocusScope.of(context).requestFocus(addressFocus);
                    },
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  width: 300,
                  child: TextFielDesign(
                    lbltext: 'Address',
                    textEditingController: addressController,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.left,
                    textInputType: TextInputType.text,
                    prefixIcon: Icons.location_on,
                    focusNode: addressFocus,
                    onSubmitted: (value) {
                      FocusScope.of(context).requestFocus(vehicleFocus);
                    },
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  width: 150,
                  child: TextFielDesign(
                    lbltext: 'Vehicle Category',
                    textEditingController: vehicleController,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.left,
                    textInputType: TextInputType.text,
                    // prefixIcon: Icons.location_on,
                    focusNode: vehicleFocus,
                    onSubmitted: (value) {
                      FocusScope.of(context).requestFocus(vehicenumberFocus);
                    },
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  width: 150,
                  child: TextFielDesign(
                    lbltext: 'Vehicle no',
                    textEditingController: vehiclenumberController,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                    textInputType: TextInputType.text,

                    // prefixIcon: Icons.location_on,
                    focusNode: vehicenumberFocus,
                    onSubmitted: (value) {
                      FocusScope.of(context).requestFocus(kmFocus);
                    },
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 100,
                      child: TextFielDesign(
                        lbltext: 'KM rate',
                        textEditingController: kmController,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,
                        textInputType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d*\.?\d{0,2}'))
                        ],

                        // prefixIcon: Icons.location_on,
                        focusNode: kmFocus,
                        onSubmitted: (value) {
                          FocusScope.of(context).requestFocus(fixrateFocus);
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      height: 50,
                      width: 100,
                      child: TextFielDesign(
                        lbltext: 'Fix rate',
                        textEditingController: fixrateController,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,
                        textInputType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d*\.?\d{0,2}'))
                        ],
                        // prefixIcon: Icons.location_on,
                        focusNode: fixrateFocus,
                        onSubmitted: (value) {
                          FocusScope.of(context).requestFocus(saveFocus);
                        },
                      ),
                    ),
                  ],
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
                        FocusScope.of(context).requestFocus(codeFocus);
                      },
                      onSubmitted: (value) {
                        FocusScope.of(context).requestFocus(codeFocus);
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
