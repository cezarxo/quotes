import 'package:quotes/core/error/exception.dart';
import 'package:quotes/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:quotes/core/network/network_info.dart';
import 'package:quotes/src/random_quotes/data/datasources/get_random_quote_local.dart';
import 'package:quotes/src/random_quotes/data/datasources/get_random_quote_remote.dart';
import 'package:quotes/src/random_quotes/domain/entities/quote.dart';
import 'package:quotes/src/random_quotes/domain/repositories/quote_repository.dart';

class QuoteRepositoryImpl implements QuoteRepository {
  final NetworkInfo networkInfo;
  final RandomQuoteRemoteDataSource randomQuoteRemoteDataSource;
  final RandomQuoteLocalDataSource randomQuoteLocalDataSource;

  QuoteRepositoryImpl({
    required this.networkInfo,
    required this.randomQuoteRemoteDataSource,
    required this.randomQuoteLocalDataSource,
  });

  @override
  Future<Either<Failure, Quote>> getRandomQuote() async {
    if (await networkInfo.isConnected) {
    try {
      final remoteRandomQuote =
          await randomQuoteRemoteDataSource.getRandomQuote();
      randomQuoteLocalDataSource.cacheQuote(remoteRandomQuote);
      return Right(remoteRandomQuote);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
    else {
      try {
        final cacheRandomQuote =
            await randomQuoteLocalDataSource.getLastRandomQuote();
        return Right(cacheRandomQuote);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
