import 'dart:async';

class MyBottomNavigationBLoC {
  int currentTab = 1;
  final _indexStreamController = StreamController<int>();
  Stream<int> get getIndexStream => _indexStreamController.stream;
  StreamSink<int> get getIndexSink => _indexStreamController.sink;
  static final myBottomNavigationBloc = MyBottomNavigationBLoC();

  final _pageStreamController = StreamController<int>.broadcast();
  Stream<int> get getPageStream => _indexStreamController.stream;
  StreamSink<int> get getPageSink => _indexStreamController.sink;
}
