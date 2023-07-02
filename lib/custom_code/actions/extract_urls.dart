// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String?> extractUrls(String? input) async {
  // Add your function code here!
  String? cleanedInput = input?.replaceAll('[', '').replaceAll(']', '');

  // Return the remaining URL
  return cleanedInput?.trim();
}
