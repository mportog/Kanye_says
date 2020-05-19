import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kanye_rest/model/quote.dart';
import 'package:kanye_rest/repository/api_repository.dart';
import 'package:mobx/mobx.dart';
part 'quote_store.g.dart';

class QuoteStore = _QuoteStoreBase with _$QuoteStore;

abstract class _QuoteStoreBase with Store {
  ApiRepository _apiRepository;
  _QuoteStoreBase() {
    _apiRepository = ApiRepository();
  }
  @observable
  bool loading = false;
  @observable
  Quote quote = Quote(error: 0, quote: "");
  @observable
  AssetImage img = AssetImage('asset/image/0.jpg');

  @action
  Future<void> getQuote() async {
    loading = true;
    imageRandomizer();
    quote = await _apiRepository.getFromApi();
    loading = false;
  }

  void imageRandomizer() {
    var random = Random().nextInt(7).toString();
    img = AssetImage('asset/image/$random.jpg');
  }
}
