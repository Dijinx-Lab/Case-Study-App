import 'package:case_study_app/models/api/base/base_response.dart';
import 'package:case_study_app/routes/navigator_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

BaseResponse toGracefulError(BaseResponse apiResponse) {
  debugPrint(apiResponse.snapshot);
  debugPrint(apiResponse.error);

  apiResponse.error == null
      ? apiResponse
      : apiResponse.error =
          NavigatorRoutes.navigatorKey.currentState?.context != null
              ? AppLocalizations.of(
                      NavigatorRoutes.navigatorKey.currentState!.context)!
                  .requestFailed
              : "";

  return apiResponse;
}
