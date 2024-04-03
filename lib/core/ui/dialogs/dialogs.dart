import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:da_assessment/core/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../../utils/keys.dart';

class Dialogs {
  static showSnackBar({required String message, AnimatedSnackBarType typeSnackBar = AnimatedSnackBarType.success}) {
    return AnimatedSnackBar.material(message, type: typeSnackBar).show(Keys.navigatorKey.currentContext!);
  }

  static showErrorSnackBar({required String message, AnimatedSnackBarType typeSnackBar = AnimatedSnackBarType.error}) {
    return AnimatedSnackBar.material(message, type: typeSnackBar).show(Keys.navigatorKey.currentContext!);
  }

  static showQuestion(context,
      {String? title, String? subtitle, Widget? content, VoidCallback? btnOkOnPress, VoidCallback? btnCancelOnPress}) {
    AwesomeDialog(
      context: Keys.navigatorKey.currentContext!,
      dialogType: DialogType.noHeader,
      headerAnimationLoop: false,
      animType: AnimType.topSlide,
      btnCancelOnPress: btnCancelOnPress,
      btnOkOnPress: btnOkOnPress,
      btnCancelText: 'Cancel',
      btnOkText: 'Ok',
      body: Column(
        children: [
          ListTile(
            title: Text(
              title!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(color: primary),
            ),
            subtitle: Text(
              subtitle!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          content!,
        ],
      ),
    ).show();
  }
}
