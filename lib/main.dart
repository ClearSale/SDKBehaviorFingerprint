import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:behavior_analytics_flutter_sdk/behavior_analytics_flutter_sdk.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? _sessionID = 'undefined';

  @override
  void initState() {
    super.initState();
    BehaviorAnalyticsFlutterSdk.start("seu_appkey_flutter");
  }

  void _handleButtonPress() {
    BehaviorAnalyticsFlutterSdk.generateSessionID().then((sessionID) {
        BehaviorAnalyticsFlutterSdk.collectDeviceInformation(sessionID);

        print(sessionID);

        setState(() {
          _sessionID = sessionID;
        });
    });

    
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('BehaviorAnalytics Plugin Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('SessionID: $_sessionID\n'),
              ElevatedButton(
                onPressed: _handleButtonPress,
                child: Text('Coletar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
