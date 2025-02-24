import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'result_screen/r.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController nicController = TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'NIC Decoder',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 134, 15, 51),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nicController,
              decoration: const InputDecoration(labelText: 'Enter NIC Number'),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String nic = nicController.text.trim();
                if (nic.isNotEmpty) {
                  Get.to(() => ResultScreen(nic: nic));
                }
              },
              child: const Text('Decode'),
            ),
          ],
        ),
      ),
    );
  }
}