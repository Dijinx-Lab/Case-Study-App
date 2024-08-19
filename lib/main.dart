import 'package:case_study_app/constants/route_keys.dart';
import 'package:case_study_app/cubits/splash/splash_cubit.dart';
import 'package:case_study_app/routes/navigator_routes.dart';
import 'package:case_study_app/services/pref_service.dart';
import 'package:case_study_app/style/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefUtil().init();
  ColorStyle.setSystemStylePref();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SplashCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        navigatorKey: NavigatorRoutes.navigatorKey,
        navigatorObservers: [FlutterSmartDialog.observer],
        builder: FlutterSmartDialog.init(),
        theme: ColorStyle.appTheme,
        initialRoute: initialRouteWithNoArgs,
        onGenerateRoute: NavigatorRoutes.allRoutes,
      ),
    );
  }
}
