
import 'package:flutter/material.dart';
import 'package:smartpaymobile/utils/constants.dart';

Widget customButtonWidget({
  required String label,
  required Function onClick,
  required BuildContext context,
  bool isActive = true
}) {
  return GestureDetector(
      onTap: () => onClick(),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: preferredButtonHeight,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: isActive ? Theme.of(context).colorScheme.primary :
            Theme.of(context).colorScheme.inversePrimary
        ),
        child: Text(
          label,
          maxLines: 1,
          style: TextStyle(
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Theme.of(context).colorScheme.onPrimary
          ),
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      )
  );
}