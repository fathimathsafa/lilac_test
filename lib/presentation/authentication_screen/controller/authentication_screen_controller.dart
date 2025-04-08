// phone_number_provider.dart
import 'package:flutter/material.dart';

class PhoneNumberProvider with ChangeNotifier {
  String _phoneNumber = '';

  String get phoneNumber => _phoneNumber;

  void setPhoneNumber(String number) {
    _phoneNumber = number;
    notifyListeners();
  }

  void clear() {
    _phoneNumber = '';
    notifyListeners();
  }
}
