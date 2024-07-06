
import 'package:flutter/material.dart';

Widget textButtonWidget({
  required String label,
  required Function onClick,
  required BuildContext context
}) {
  return GestureDetector(
      onTap: () => onClick(),
      child: Text(
        label,
        style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 16,
            fontWeight: FontWeight.w600
        ),
        maxLines: 1,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
      )
  );
}