import 'package:flutter/material.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'package:quotes/src/random_quotes/presentation/cubit/random_quotes_cubit.dart';
import 'package:quotes/src/random_quotes/presentation/views/quotes_view.dart';
import 'package:quotes/injector.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/src/splash/presentation/screens/splash_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String randomQuoteRoute = '/randomQuote';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) {
          return const SplashScreen();
        });

      case Routes.randomQuoteRoute:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: ((context) => di.sl<RandomQuoteCubit>()),
            child: const QuotesView(),
          );
        });
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: ((context) => const Scaffold(
            body: Center(
              child: Text(AppStrings.noRouteFound),
            ),
          )),
    );
  }
}
