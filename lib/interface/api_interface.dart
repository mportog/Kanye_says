import 'package:kanye_rest/model/quote.dart';

abstract class IApiInterface {
  Future<Quote> getFromApi();
}
