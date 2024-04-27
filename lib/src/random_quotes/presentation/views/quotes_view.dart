import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quotes/config/locale/app_localizations.dart';
import 'package:quotes/core/utils/app_colors.dart';
import 'package:quotes/src/random_quotes/presentation/cubit/random_quotes_cubit.dart';
import 'package:quotes/core/widgets/error_widget.dart' as error_widget;
import 'package:quotes/src/splash/presentation/cubit/locale_cubit.dart';

import '../widgets/quote_content.dart';

class QuotesView extends StatefulWidget {
  const QuotesView({super.key});

  @override
  State<QuotesView> createState() => _QuotesViewState();
}

class _QuotesViewState extends State<QuotesView> {
  _getRandomQuote() =>
      BlocProvider.of<RandomQuoteCubit>(context).getRandomQuote();
      
  @override
  void initState() {
    super.initState();
    _getRandomQuote();
  }

  Widget _buildBodyContent() {
    return BlocBuilder<RandomQuoteCubit, RandomQuoteState>(
        builder: ((context, state) {
      if (state is RandomQuoteIsLoading) {
        return const Center(
          child: SpinKitFadingCircle(
            color: AppColors.primary,
          ),
        );
      } else if (state is RandomQuoteError) {
        return error_widget.ErrorWidget(
          onPress: () => _getRandomQuote(),
        );
      } else if (state is RandomQuoteLoaded) {
        return Column(
          children: [
            QuoteContent(
              quote: state.quote,
            ),
            InkWell(
                onTap: () => _getRandomQuote(),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.primary),
                  child: const Icon(
                    Icons.refresh,
                    size: 28,
                    color: Colors.white,
                  ),
                ))
          ],
        );
      } else {
        return const Center(
          child: SpinKitFadingCircle(
            color: AppColors.primary,
          ),
        );
      }
    }));
  }



  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title:  Text(AppLocalizations.of(context)!.translate('app_name')!),
      leading: IconButton(
        icon: const Icon(
          Icons.translate_outlined,
          color: AppColors.primary,
        ),
        onPressed: () {
          if (AppLocalizations.of(context)!.isEnLocale) {
            BlocProvider.of<LocaleCubit>(context).toArabic();
          } else {
            BlocProvider.of<LocaleCubit>(context).toEnglish();
          }
        },
      ),
    );
    return RefreshIndicator(
      onRefresh: () => _getRandomQuote(),
      child: Scaffold(
        appBar: appBar,
        body: _buildBodyContent(),
      ),
    );
  }
}
