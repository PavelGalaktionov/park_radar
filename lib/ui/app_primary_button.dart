import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/common_classes.dart';
import '../utils/constants.dart';
import 'ios/ios_app_button.dart';

class AppPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AppPrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return SizedBox(
        width: MediaQuery.of(context).size.width * ios_app_button_width,
        child: AppButton(
          text: text,
          color: CupertinoColors.activeBlue,
          onPressed: onPressed,
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(left: padding8, right: padding8, bottom: padding5),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: CustomTextStyle.labelTextStyleWhiteBold14(context),
        ),
      ),
    );
  }
}