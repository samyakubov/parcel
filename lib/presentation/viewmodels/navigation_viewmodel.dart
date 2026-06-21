import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void goTo(int index) => state = index;
}

final selectedTabProvider = NotifierProvider<NavigationNotifier, int>(NavigationNotifier.new);
