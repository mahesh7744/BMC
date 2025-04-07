import 'package:flutter/material.dart';
import 'package:bmc/customewidgets/custom_textfield.dart';
import 'package:flutter/services.dart';
import 'package:bmc/customewidgets/custom_button.dart';

class Usermaster extends StatefulWidget {
  const Usermaster({super.key});

  @override
  State<Usermaster> createState() => _UsermasterState();
}

class _UsermasterState extends State<Usermaster> {
  TextEditingController usernamenameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  TextEditingController salerateController = TextEditingController();
  TextEditingController purchaserateController = TextEditingController();
  TextEditingController openingstockController = TextEditingController();

  FocusNode usernamenameFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode confirmpasswordFocus = FocusNode();
  FocusNode salerateFocus = FocusNode();
  FocusNode purchaserateFocus = FocusNode();
  FocusNode oprningstockFocus = FocusNode();
  FocusNode saveFocus = FocusNode();

  @override
  void dispose() {
    // FocusNode dispose करणे आवश्यक आहे
    usernamenameFocus.dispose();
    passwordFocus.dispose();
    confirmpasswordFocus.dispose();
    salerateFocus.dispose();
    purchaserateFocus.dispose();
    oprningstockFocus.dispose();
    saveFocus.dispose();

    super.dispose();
  }

  bool _isPasswordVisible = false;
  bool _isPasswordVisible1 = false;
  bool isEditChecked = false;
  bool isDeleteChecked = false;

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
          'User Master',
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
            width: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  width: 200,
                  child: TextFielDesign(
                    lbltext: 'User Name',
                    textEditingController: usernamenameController,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.left,
                    textInputType: TextInputType.text,
                    // focusNode: cattlefeednameFocus,
                    // onSubmitted: (value) {
                    //   FocusScope.of(context).requestFocus(packingFocus);
                    // },
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  width: 200,
                  child: TextFielDesign(
                    lbltext: 'Password',
                    textEditingController: passwordController,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.left,
                    textInputType: TextInputType.text,
                    obscureText: !_isPasswordVisible,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  width: 200,
                  child: TextFielDesign(
                    lbltext: 'Confirm Password',
                    textEditingController: confirmpasswordController,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.left,
                    textInputType: TextInputType.text,
                    obscureText: !_isPasswordVisible1,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible1
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible1 = !_isPasswordVisible1;
                        });
                      },
                    ),
                    //  prefixIcon: Icon(Icons.inventory),
                    // focusNode: packingFocus,
                    // onSubmitted: (value) {
                    //   FocusScope.of(context).requestFocus(gstFocus);
                    // },
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: isEditChecked,
                          onChanged: (value) {
                            setState(() {
                              isEditChecked = value!;
                            });
                          },
                        ),
                        const Text('Edit'),
                      ],
                    ),
                    const SizedBox(width: 20), // spacing between checkboxes
                    Row(
                      children: [
                        Checkbox(
                          value: isDeleteChecked,
                          onChanged: (value) {
                            setState(() {
                              isDeleteChecked = value!;
                            });
                          },
                        ),
                        const Text('Delete'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomButton(
                      width: 80,
                      height: 40,
                      text: 'Delete',
                      icon: Icons.delete,
                      onPressed: () {},
                    ),
                    SizedBox(width: 20),
                    CustomButton(
                      width: 80,
                      height: 40,
                      text: 'Save',
                      focusNode: saveFocus,
                      icon: Icons.save,
                      onPressed: () {
                        // FocusScope.of(context)
                        //     .requestFocus(cattlefeednameFocus);
                      },
                      onSubmitted: (value) {
                        // FocusScope.of(context)
                        //     .requestFocus(cattlefeednameFocus);
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
