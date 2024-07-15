// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';

Future<dynamic> stringtojsonparsor(String? qrdata) async {
  // convert json string to json object as a paser
  if (qrdata != null) {
    try {
      final jsonData = json.decode(qrdata);
      return jsonData;
    } catch (e) {
      print(e.toString());
      return null;
    }
  } else {
    return null;
  }
}
