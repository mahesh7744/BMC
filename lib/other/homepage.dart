import 'package:bmc/master/accountmaster.dart';
import 'package:bmc/master/membermaster.dart';
import 'package:bmc/master/ratechart.dart';
import 'package:bmc/master/sanghmaster.dart';
import 'package:bmc/master/sanghratechart.dart';
import 'package:bmc/master/supplymaster.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
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
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Membermaster()),
                );
              },
              child: Text("Member Master"),
            ),
            SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Ratechart()),
                );
              },
              child: Text("Rate Chart"),
            ),
            SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Accountmaster()),
                );
              },
              child: Text("Account Master"),
            ),
            SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Supplymaster()),
                );
              },
              child: Text("Supplyer Master"),
            ),
            SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Sanghmaster()),
                );
              },
              child: Text("Sangh Master"),
            ),
            SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Sanghratechart()),
                );
              },
              child: Text("Sangh rate chart"),
            ),
          ],
        ),
      )),
    );
  }
}
