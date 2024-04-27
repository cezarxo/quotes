import 'package:quotes/core/api/api_consumer.dart';
import 'package:quotes/core/api/endpoint.dart';
import 'package:quotes/src/random_quotes/data/models/quote_model.dart';

abstract class RandomQuoteRemoteDataSource {
  Future<QuoteModel> getRandomQuote();
}

class RandomQuoteRemoteDataSourceImpl implements RandomQuoteRemoteDataSource {
  ApiConsumer apiConsumer;

  RandomQuoteRemoteDataSourceImpl({
    required this.apiConsumer,
  });

  @override
  Future<QuoteModel> getRandomQuote() async {
    final response = await apiConsumer.get(
      EndPoints.randomQuote,
    );
      return QuoteModel.fromJson(response);
  }
}
