import 'package:case_study_app/constants/route_keys.dart';
import 'package:case_study_app/cubits/language/language_cubit.dart';
import 'package:case_study_app/cubits/splash/splash_cubit.dart';
import 'package:case_study_app/cubits/team/team_cubit.dart';
import 'package:case_study_app/routes/navigator_routes.dart';
import 'package:case_study_app/services/pref_service.dart';
import 'package:case_study_app/style/color/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        BlocProvider(create: (_) => LanguageCubit()),
        BlocProvider(create: (_) => SplashCubit()),
        BlocProvider(create: (_) => TeamCubit()),
      ],
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Case Study App',
            debugShowCheckedModeBanner: false,
            navigatorKey: NavigatorRoutes.navigatorKey,
            navigatorObservers: [FlutterSmartDialog.observer],
            builder: FlutterSmartDialog.init(),
            theme: ColorStyle.appTheme,
            initialRoute: initialRouteWithNoArgs,
            onGenerateRoute: NavigatorRoutes.allRoutes,
            localizationsDelegates: _getLocalizationDelegates(),
            supportedLocales: _getSupportedLocals(),
            locale: state.selectedLanguage.value,
            localeResolutionCallback: _resolveLocale,
          );
        },
      ),
    );
  }

  Locale? _resolveLocale(Locale? locale, Iterable<Locale> supportedLocales) {
    return locale;
  }

  _getLocalizationDelegates() {
    return [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      AppLocalizations.delegate,
    ];
  }

  _getSupportedLocals() {
    return [
      const Locale('en'),
    ];
  }
}
