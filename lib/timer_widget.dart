import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'myhook.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({Key? key}) : super(key: key);

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {

  Timer? _timer;
  int _counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState((){
        _counter = timer.tick;
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          _counter.toString(),
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}


class TimerWidgetUsingHooks extends HookWidget {
  const TimerWidgetUsingHooks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var _counter = useState(0);

    useEffect(() {
      Timer _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        _counter.value=timer.tick;
      });

      return _timer.cancel;
    },[]);

    return Scaffold(
      body: Center(
        child: Text(
          _counter.value.toString(),
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}


class TimerWithCustomHook extends HookWidget {
  const TimerWithCustomHook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int counter = useMyHook();
    return Scaffold(
      body: Center(
        child: Text(
          counter.toString(),
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
