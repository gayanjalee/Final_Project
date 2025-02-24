import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'nic_processing_logic/nic_decoder.dart';

class ResultScreen extends StatelessWidget {
  final String nic;
  const ResultScreen({super.key, required this.nic});

  @override
  Widget build(BuildContext context) {
    final decodedNIC = NICDecoder.decode(nic);
    return Scaffold(
      appBar: AppBar(title: const Text('NIC Details',style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 134, 15, 51),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('NIC Type: ${decodedNIC["type"]}'),
              Text('Date of Birth: ${decodedNIC["dob"]}'),
              Text('Weekday: ${decodedNIC["weekday"]}'),
              Text('Age: ${decodedNIC["age"]}'),
              Text('Gender: ${decodedNIC["gender"]}'),
              if (decodedNIC.containsKey("voting")) Text('Voting Eligibility: ${decodedNIC["voting"]}'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Get.back(),
                child: const Text('Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}