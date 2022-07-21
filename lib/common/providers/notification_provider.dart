import 'package:flutter/material.dart';

class NotificationProvider with ChangeNotifier {
  String? _body;

  String get body => _body!;

  set body(String value) {
    _body = value;
    notifyListeners();
  }
}