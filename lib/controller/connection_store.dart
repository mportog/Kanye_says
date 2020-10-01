import 'package:mobx/mobx.dart';
part 'connection_store.g.dart';

class ConnectionStore = _ConnectionStoreBase with _$ConnectionStore;

abstract class _ConnectionStoreBase with Store {
  @observable
  bool hasConnection = false;

  @action
  void setConnection(bool newValue) => hasConnection = newValue;
}
