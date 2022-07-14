
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

int useMyHook(){
  return use(_MyHook());
}

class _MyHook extends Hook<int> {
  @override
  HookState<int, Hook<int>> createState() {
    // TODO: implement createState
    return _MyHookState();
  }

}

class _MyHookState extends HookState<int, _MyHook> {

  int _counter = 0;
  Timer? _timer;

  @override
  void initHook() {
    // TODO: implement initHook
    super.initHook();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _counter=timer.tick;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer?.cancel();
  }

  @override
  int build(BuildContext context) {
    return _counter;
  }
}
