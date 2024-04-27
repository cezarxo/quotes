import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/config/locale/app_localizations_setup.dart';
import 'package:quotes/config/routes/app_routes.dart';
import 'package:quotes/config/themes/app_theme.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'package:quotes/src/splash/presentation/cubit/locale_cubit.dart';
import 'injector.dart' as di;


class QuotesApp extends StatelessWidget {
  const QuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => di.sl<LocaleCubit>()),
        ],
        child: BlocBuilder<LocaleCubit, LocaleState>(
          buildWhen: (previousState, currentState) {
            return previousState != currentState;
          },
          builder: (context, state) {
            return MaterialApp(
              title: AppStrings.appName,
              locale: state.locale,
              debugShowCheckedModeBanner: false,
              theme: appTheme(),
              onGenerateRoute: AppRoutes.onGenerateRoute,
              supportedLocales: AppLocalizationsSetup.supportedLocales,
              localeResolutionCallback:
                  AppLocalizationsSetup.localeResolutionCallback,
              localizationsDelegates:
                  AppLocalizationsSetup.localizationsDelegates,
            );
          },
        ));
  }
  }

