
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



String formatInvoiceNo(double number) {
  String invoiceNo = number.toInt().toString();

  if (invoiceNo.isEmpty) {
    return '';
  }
  final int count = 7 - invoiceNo.length;

  for (int index = 0; index < count; index++) {
    invoiceNo = '0' + invoiceNo;
  }

  return invoiceNo;
}


String twoDigits(int n) {
  if (n >= 10) return '$n';
  return '0$n';
}

String formatBySeconds(Duration duration) =>
    twoDigits(duration.inSeconds.remainder(60));

String formatByMinutes(Duration duration) {
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  return '$twoDigitMinutes:${formatBySeconds(duration)}';
}

String formatByHours(Duration duration) {
  return '${twoDigits(duration.inHours)}:${formatByMinutes(duration)}';
}
