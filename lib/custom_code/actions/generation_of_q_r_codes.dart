// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:pdf/widgets.dart' as pw;
import 'dart:typed_data';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

Future<String> generationOfQRCodes(
  int? carduid,
  String? lotuid,
  int? noofqrcodes,
) async {
  if (carduid == null || lotuid == null || noofqrcodes == null) {
    return 'Invalid input';
  }

  // Request storage permissions
  bool permissionsGranted = await requestPermissions();
  if (!permissionsGranted) {
    return 'Storage permission not granted';
  }

  final pdf = pw.Document();

  for (int i = 0; i < noofqrcodes; i++) {
    String qrData = '{"lot_uid": "$lotuid", "card_uid": "${carduid + i}"}';

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Center(
            child: pw.BarcodeWidget(
              data: qrData,
              barcode: pw.Barcode.qrCode(),
              width: 2000,
              height: 2000,
            ),
          );
        },
      ),
    );
  }

  // Save the PDF file as bytes
  final Uint8List pdfBytes = await pdf.save();

  // Android-specific code using path_provider
  final directory = await getDownloadsDirectory();
  final filePath = '${directory!.path}/qrcodes.pdf';
  final file = File(filePath);
  await file.writeAsBytes(pdfBytes);

  return 'PDF generated and saved to $filePath';
}

Future<bool> requestPermissions() async {
  if (Platform.isAndroid) {
    // Check if permission is already granted
    var status = await Permission.manageExternalStorage.status;
    if (!status.isGranted) {
      // Request permission
      var result = await Permission.manageExternalStorage.request();
      if (result.isGranted) {
        return true;
      } else {
        return false;
      }
    } else {
      return true;
    }
  }
  // For other platforms, return true since permission is not needed
  return true;
}
