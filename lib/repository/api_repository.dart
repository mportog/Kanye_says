import 'dart:convert';

import 'package:kanye_rest/interface/api_interface.dart';
import 'package:kanye_rest/model/quote.dart';
import 'package:kanye_rest/shared/api.dart';
import 'package:http/http.dart' as http;

class ApiRepository implements IApiInterface {
  @override
  Future<Quote> getFromApi() async {
    try {
      String url = '${Api.completeUrl}';
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var quoteDecoded = jsonDecode(response.body);
        Quote quote = Quote.fromJson(quoteDecoded);
        quote.error = null;
        return quote;
      } else {
        print('Request failed with status: ${response.statusCode}.');
        return Quote(error: response.statusCode, quote: '');
      }
    } catch (e) {
      print('Error on Http GET: $e');
      return Quote(quote: '');
    }
  }
}
