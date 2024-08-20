// ignore_for_file: use_build_context_synchronously

import 'package:case_study_app/models/api/base/base_response.dart';
import 'package:case_study_app/routes/navigator_routes.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<BaseResponse> checkInternetConnection() async {
  var connectivityResult = await Connectivity().checkConnectivity();
  bool isConnected = connectivityResult.contains(ConnectivityResult.wifi) ||
      connectivityResult.contains(ConnectivityResult.mobile);

  return BaseResponse(
      0,
      null,
      isConnected
          ? null
          : NavigatorRoutes.navigatorKey.currentState?.context != null &&
                  NavigatorRoutes.navigatorKey.currentState!.context.mounted
              ? AppLocalizations.of(
                      NavigatorRoutes.navigatorKey.currentState!.context)!
                  .noInternetConnection
              : "");
}
