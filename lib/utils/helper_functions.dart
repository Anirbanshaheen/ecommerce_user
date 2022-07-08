import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void showMsg(BuildContext context, String msg) {
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(msg)));
}

String getFormattedDate(int dt, String format) {
  return DateFormat(format).format(DateTime.fromMillisecondsSinceEpoch(dt));
}