// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$QuoteStore on _QuoteStoreBase, Store {
  final _$loadingAtom = Atom(name: '_QuoteStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$quoteAtom = Atom(name: '_QuoteStoreBase.quote');

  @override
  Quote get quote {
    _$quoteAtom.reportRead();
    return super.quote;
  }

  @override
  set quote(Quote value) {
    _$quoteAtom.reportWrite(value, super.quote, () {
      super.quote = value;
    });
  }

  final _$imgAtom = Atom(name: '_QuoteStoreBase.img');

  @override
  AssetImage get img {
    _$imgAtom.reportRead();
    return super.img;
  }

  @override
  set img(AssetImage value) {
    _$imgAtom.reportWrite(value, super.img, () {
      super.img = value;
    });
  }

  final _$getQuoteAsyncAction = AsyncAction('_QuoteStoreBase.getQuote');

  @override
  Future<void> getQuote() {
    return _$getQuoteAsyncAction.run(() => super.getQuote());
  }

  @override
  String toString() {
    return '''
loading: ${loading},
quote: ${quote},
img: ${img}
    ''';
  }
}
