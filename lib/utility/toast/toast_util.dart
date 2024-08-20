import 'package:case_study_app/routes/navigator_routes.dart';
import 'package:case_study_app/style/color/color_styles.dart';
import 'package:flutter/material.dart';

class ToastUtils {
  static showCustomSnackbar({
    required String contentText,
    BuildContext? context,
    ToastTypes type = ToastTypes.fail,
    int second = 4,
    bool isShowIcon = true,
    bool isCenteredText = false,
  }) {
    if (contentText == "") return;

    final snackbar = SnackBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isShowIcon
              ? Icon(
                  type == ToastTypes.success
                      ? Icons.check_circle_outline
                      : type == ToastTypes.fail
                          ? Icons.error_outline
                          : Icons.info_outline,
                  color: ColorStyle.whiteColor,
                )
              : const SizedBox(
                  width: 0,
                  height: 0,
                ),
          isShowIcon
              ? const SizedBox(
                  width: 10,
                )
              : const SizedBox(
                  width: 0,
                  height: 0,
                ),
          Expanded(
            child: Text(
              contentText,
              textAlign: isCenteredText ? TextAlign.center : TextAlign.start,
              style: const TextStyle(
                  color: ColorStyle.whiteColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
      backgroundColor: type == ToastTypes.fail
          ? ColorStyle.red100Color
          : type == ToastTypes.info
              ? ColorStyle.primaryColor
              : ColorStyle.green100Color,
      duration: Duration(seconds: second),
      behavior: SnackBarBehavior.fixed,
    );

    BuildContext? ctx = context ?? NavigatorRoutes.navigatorKey.currentContext;

    if (ctx == null) return;

    ScaffoldMessenger.of(ctx)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackbar);
  }
}

enum ToastTypes { fail, success, info }
