import 'package:intl/intl.dart';

class NICDecoder {
  static Map<String, String> decode(String nic) {
    bool isNewFormat = nic.length == 12;
    int birthYear = isNewFormat ? int.parse(nic.substring(0, 4)) : int.parse(nic.substring(0, 2)) + (int.parse(nic.substring(0, 2)) < 20 ? 2000 : 1900);
    int dayCode = int.parse(nic.substring(isNewFormat ? 4 : 2, isNewFormat ? 7 : 5));
    String gender = dayCode < 500 ? 'Male' : 'Female';
    if (dayCode >= 500) dayCode -= 500;

    DateTime dob = DateTime(birthYear).add(Duration(days: dayCode - 1));
    String weekday = DateFormat('EEEE').format(dob);
    int age = DateTime.now().year - dob.year;

    Map<String, String> result = {
      "type": isNewFormat ? "New" : "Old",
      "dob": "${dob.year}-${dob.month}-${dob.day}",
      "weekday": weekday,
      "age": "$age",
      "gender": gender
    };
    
    if (!isNewFormat) {
      result["voting"] = nic.endsWith('V') ? "Eligible" : "Not Eligible";
    }
    return result;
  }
}