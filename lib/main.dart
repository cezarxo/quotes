import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/app.dart';
import 'package:quotes/bloc_observer.dart';
import 'injector.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  Bloc.observer = AppBlocObserver();
  runApp(const QuotesApp());
}
