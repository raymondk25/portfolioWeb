import 'package:flutter/material.dart';
import 'package:get/get.dart';

// This extension provides a custom dialog implementation
// to avoid the backgroundColor issue in Get package
extension GetExtensionFix on GetInterface {
  Future<T?> customDialog<T>({
    String title = "Alert",
    String? middleText,
    String? textConfirm,
    String? textCancel,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    Color? confirmTextColor,
    Color? cancelTextColor,
    bool barrierDismissible = true,
    Color? backgroundColor,
    Color? buttonColor,
  }) {
    final theme = Theme.of(Get.context!);

    return Get.dialog<T>(
      AlertDialog(
        title: Text(title, textAlign: TextAlign.center),
        content: middleText != null
            ? Text(middleText, textAlign: TextAlign.center)
            : null,
        backgroundColor: backgroundColor ?? theme.dialogBackgroundColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        actions: [
          if (textCancel != null)
            TextButton(
              child: Text(
                textCancel,
                style: TextStyle(
                    color: cancelTextColor ?? theme.colorScheme.secondary),
              ),
              onPressed: () {
                Get.back();
                onCancel?.call();
              },
            ),
          if (textConfirm != null)
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: buttonColor ?? theme.colorScheme.secondary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
              ),
              child: Text(
                textConfirm,
                style: TextStyle(
                    color: confirmTextColor ?? theme.colorScheme.onSecondary),
              ),
              onPressed: () {
                Get.back();
                onConfirm?.call();
              },
            ),
        ],
      ),
      barrierDismissible: barrierDismissible,
    );
  }
}
