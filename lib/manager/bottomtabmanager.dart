import 'package:ecampus/manager/manager.dart';
import 'package:rxdart/rxdart.dart';

class BottomTabManager extends Manager {
  final BehaviorSubject<int> _pageIndex = BehaviorSubject<int>();

  int get pageIndex => _pageIndex.value;
  set pageIndex(int value) => _pageIndex.value = value;
  @override
  void dispose() {
    _pageIndex.close();
  }
}
