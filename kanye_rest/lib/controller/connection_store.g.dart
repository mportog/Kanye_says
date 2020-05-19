// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConnectionStore on _ConnectionStoreBase, Store {
  final _$hasConnectionAtom = Atom(name: '_ConnectionStoreBase.hasConnection');

  @override
  bool get hasConnection {
    _$hasConnectionAtom.reportRead();
    return super.hasConnection;
  }

  @override
  set hasConnection(bool value) {
    _$hasConnectionAtom.reportWrite(value, super.hasConnection, () {
      super.hasConnection = value;
    });
  }

  final _$_ConnectionStoreBaseActionController =
      ActionController(name: '_ConnectionStoreBase');

  @override
  void setConnection(bool newValue) {
    final _$actionInfo = _$_ConnectionStoreBaseActionController.startAction(
        name: '_ConnectionStoreBase.setConnection');
    try {
      return super.setConnection(newValue);
    } finally {
      _$_ConnectionStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hasConnection: ${hasConnection}
    ''';
  }
}
