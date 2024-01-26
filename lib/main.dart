import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:behavior_analytics_flutter_sdk/behavior_analytics_flutter_sdk.dart';

import 'events/UserEventType.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? _sessionID = 'undefined';
  static List<String> userEventList = UserEventType.values.map(((e) => e.name)).toList();
  String dropdownValue = userEventList.first;

  @override
  void initState() {
    super.initState();
    BehaviorAnalyticsFlutterSdk.start("appkey_fornecido_pela_clearsale");
  }

  void _handleButtonPress() {
    BehaviorAnalyticsFlutterSdk.generateSessionID().then((sessionID) {
      BehaviorAnalyticsFlutterSdk.collectDeviceInformation(sessionID);
      BehaviorAnalyticsFlutterSdk.sendEvent(UserEventType.values.firstWhere((e) => e.name == dropdownValue), sessionID);
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
              DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.blue,
                ),
                onChanged: (String? value) {
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                items:
                    userEventList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 10),
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
