import 'package:flutter/material.dart';

class Membermaster extends StatefulWidget {
  const Membermaster({super.key});

  @override
  State<Membermaster> createState() => _MembermasterState();
}

class _MembermasterState extends State<Membermaster> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(title: Text('Member Master',style: TextStyle(fontSize: 18,fontFamily: 'Roboto'),),),

        
    );
  }
}