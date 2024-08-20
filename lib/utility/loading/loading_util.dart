import 'dart:io';

import 'package:case_study_app/style/color/color_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingUtil {
  static Widget buildAdaptiveLoader({Color color = ColorStyle.primaryColor}) {
    return Center(
        child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Platform.isAndroid
                ? CircularProgressIndicator(
                    color: color,
                  )
                : CupertinoActivityIndicator(
                    radius: 15,
                    color: color,
                  )));
  }

  static Widget buildLineLoader({Color color = ColorStyle.primaryColor}) {
    return Center(
      child: LinearProgressIndicator(
        color: color,
      ),
    );
  }
}
