import 'package:bmc/master/cattlefeedmaster.dart';
import 'package:bmc/master/rootmaster.dart';
import 'package:bmc/master/transportmaster.dart';
import 'package:bmc/master/usermaster.dart';
import 'package:bmc/other/app_localizations.dart';
import 'package:bmc/other/globaldata.dart';
import 'package:bmc/other/locale_provider.dart';
import 'package:flutter/material.dart';
import 'package:bmc/customewidgets/custom_button.dart';
import 'package:bmc/master/accountmaster.dart';
import 'package:bmc/master/membermaster.dart';
import 'package:bmc/master/ratechart.dart';
import 'package:bmc/master/sanghmaster.dart';
import 'package:bmc/master/sanghratechart.dart';
import 'package:bmc/master/supplymaster.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent.shade100,
        centerTitle: true,
        title: const Text(
          'Home Page',
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'Roboto',
            color: Colors.white,
          ),
        ),
        actions: [
          DropdownButton<Locale>(
            hint: Text(
              "Language",
              style: TextStyle(
                  fontFamily: 'Roboto', fontSize: 10, color: Colors.white),
            ),
            items: [
              DropdownMenuItem(
                child: Text('English'),
                value: Locale('en'),
                onTap: () {
                  provider.setLocale(Locale('en'));
                  GlobalData.enmrkn = 'en';
                },
              ),
              DropdownMenuItem(
                child: Text('मराठी'),
                value: Locale('mr'),
                onTap: () {
                  provider.setLocale(Locale('mr'));
                  GlobalData.enmrkn = 'mr';
                },
              ),
              DropdownMenuItem(
                child: Text('ಕನ್ನಡ'),
                value: Locale('kn'),
                onTap: () {
                  provider.setLocale(Locale('kn'));
                  GlobalData.enmrkn = 'kn';
                },
              ),
            ],
            onChanged: (Locale? locale) {
              setState(() {});
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 20),
                CustomButton(
                  width: 200,
                  height: 50,
                  text: 'societymaster'.tr(context),
                  icon: Icons.next_plan,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Membermaster()),
                    );
                  },
                ),
                const SizedBox(height: 10),
                CustomButton(
                  width: 200,
                  height: 50,
                  text: 'Rate Chart',
                  icon: Icons.next_plan,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Ratechart()),
                    );
                  },
                ),
                const SizedBox(height: 10),
                CustomButton(
                  width: 200,
                  height: 50,
                  text: 'Account Master',
                  icon: Icons.next_plan,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Accountmaster()),
                    );
                  },
                ),
                const SizedBox(height: 10),
                CustomButton(
                  width: 200,
                  height: 50,
                  text: 'Supply Master',
                  icon: Icons.next_plan,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Supplymaster()),
                    );
                  },
                ),
                const SizedBox(height: 10),
                CustomButton(
                  width: 200,
                  height: 50,
                  text: 'Sangh Master',
                  icon: Icons.next_plan,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Sanghmaster()),
                    );
                  },
                ),
                const SizedBox(height: 10),
                CustomButton(
                  width: 200,
                  height: 50,
                  text: 'Sangh Rate Chart',
                  icon: Icons.next_plan,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Sanghratechart()),
                    );
                  },
                ),
                const SizedBox(height: 10),
                CustomButton(
                  width: 200,
                  height: 50,
                  text: 'Root Master',
                  icon: Icons.next_plan,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Rootmaster()),
                    );
                  },
                ),
                const SizedBox(height: 10),
                CustomButton(
                  width: 200,
                  height: 50,
                  text: 'Cattle feed Master',
                  icon: Icons.next_plan,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Cattlefeedmaster()),
                    );
                  },
                ),
                const SizedBox(height: 10),
                CustomButton(
                  width: 200,
                  height: 50,
                  text: 'User Master',
                  icon: Icons.next_plan,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Usermaster()),
                    );
                  },
                ),
                const SizedBox(height: 10),
                CustomButton(
                  width: 200,
                  height: 50,
                  text: 'Transport Master',
                  icon: Icons.next_plan,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Transportmaster()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
