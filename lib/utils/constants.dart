
import 'package:flutter/material.dart';

const double preferredButtonHeight = 56;
const String baseUrl = 'mobile-test-2d7e555a4f85.herokuapp.com';

void toastMessage({
  required String message,
  required Color background,
  required Color textColor,
  required BuildContext context
}) {
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(
            message,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: textColor
            ),
          ),
          duration: const Duration(seconds: 5),
          backgroundColor: background,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(10.0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0)
          )
      )
  );
}