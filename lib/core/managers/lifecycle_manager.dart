import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:spacera/core/services/connectivity/connectivity_service.dart';
import 'package:spacera/core/services/stoppable_service.dart';
import 'package:spacera/locator.dart';

/// A manager to start/stop [StoppableService]s when the app goes/returns into/from the background
class LifeCycleManager extends StatefulWidget {
  final Widget? child;

  const LifeCycleManager({Key? key, this.child}) : super(key: key);

  @override
  _LifeCycleManagerState createState() => _LifeCycleManagerState();
}

class _LifeCycleManagerState extends State<LifeCycleManager>
    with WidgetsBindingObserver {
  final _log = Logger('LifeCycleManager');
  final servicesToManage = <StoppableService?>[
    locator<ConnectivityService>(),
  ];

  @override
  Widget build(BuildContext context) {
    return widget.child!;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    _log.fine('App life cycle change to $state');
    for (var service in servicesToManage) {
      if (state == AppLifecycleState.resumed) {
        service!.start();
      } else {
        service!.stop();
      }
    }
  }
}
