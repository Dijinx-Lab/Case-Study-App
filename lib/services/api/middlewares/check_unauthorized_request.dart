import 'package:case_study_app/models/api/base/base_response.dart';
import 'package:case_study_app/routes/navigator_routes.dart';
import 'package:case_study_app/services/shared_preferences/pref_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

BaseResponse checkUnauthorizedRequest(BaseResponse apiResponse) {
  if (apiResponse.status == 401) {
    PrefUtil().currentTeam = null;
    return BaseResponse(
        0,
        null,
        NavigatorRoutes.navigatorKey.currentState?.context != null
            ? AppLocalizations.of(
                    NavigatorRoutes.navigatorKey.currentState!.context)!
                .sessionExpired
            : "");
  }
  return apiResponse;
}
