import 'package:quotes/src/random_quotes/domain/entities/quote.dart';

class QuoteModel extends Quote {
  QuoteModel({
    required super.author,
    String? id,
    required super.content,
  }) : super(
          id: id!,
        );

  factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
        id: json["_id"],
        author: json["author"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "author": author,
        "content": content,
      };
}
