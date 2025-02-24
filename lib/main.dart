import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'input screen/home_screen.dart';

void main() {
  runApp(const NICDecoderApp());
}

class NICDecoderApp extends StatelessWidget {
  const NICDecoderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NIC Decoder',
      home: HomeScreen(),
    );
  }
}