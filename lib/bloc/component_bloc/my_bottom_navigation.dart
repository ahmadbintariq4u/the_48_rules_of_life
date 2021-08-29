import 'dart:async';

class MyBottomNavigationBLoC {
  int currentTab = 1;
  final _indexStreamController = StreamController<int>();
  Stream<int> get getIndexStream => _indexStreamController.stream;
  StreamSink<int> get getIndexSink => _indexStreamController.sink;
  static final myBottomNavigationBloc = MyBottomNavigationBLoC();

  void onDispose() {
    _indexStreamController.close();
  }
}
