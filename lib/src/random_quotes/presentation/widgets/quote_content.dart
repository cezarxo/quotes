import 'package:flutter/material.dart';
import 'package:quotes/core/utils/app_colors.dart';
import 'package:quotes/src/random_quotes/domain/entities/quote.dart';

class QuoteContent extends StatelessWidget {
  final Quote quote;
  const QuoteContent({
    super.key,
    required this.quote,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: AppColors.primary, borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          Text(quote.content,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: Text(quote.author,
                style: Theme.of(context).textTheme.bodyMedium),
          )
        ],
      ),
    );
  }
}
