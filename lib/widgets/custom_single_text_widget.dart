
import 'package:flutter/material.dart';

Widget customSingleTextWidget({
  required String label,
  required double size,
  required FontWeight weight,
  required Color textColor
}) {
  return Text(
    label,
    style: TextStyle(
      fontSize: size,
      fontFamily: 'SF Pro Display',
      fontWeight: weight,
      color: textColor
    ),
    maxLines: 1,
    textAlign: TextAlign.start,
    overflow: TextOverflow.ellipsis,
  );
}