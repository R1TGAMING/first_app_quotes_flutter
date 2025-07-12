import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class QuoteApi {
  final String quote;
  final String author;
  final String category;

  const QuoteApi({
    required this.quote,
    required this.author,
    required this.category,
  });

  factory QuoteApi.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'quote': String quote,
        'author': String author,
        'category': String category,
      } =>
        QuoteApi(quote: quote, author: author, category: category),
      _ => throw const FormatException('Failed to load Quotes'),
    };
  }
}

Future<QuoteApi> fetchQuote() async {
  final response = await http.get(
    Uri.parse('https://api.api-ninjas.com/v1/quotes'),
    headers: {'X-Api-Key': dotenv.env['NINJA_API_KEY']!},
  );

  if (response.statusCode == 200) {
    final List<dynamic> jsonList = jsonDecode(response.body);
    return QuoteApi.fromJson(jsonList[0]);
  } else {
    return throw Exception('Failed to Load Quotes');
  }
}
