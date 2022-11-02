import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  CallApi api = CallApi();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: TextButton(
              onPressed: () async {
                // var data = await api.getSingle();

                var data = await api.getListPerson();

                log('response ${data.data}');
              },
              child: Text('Login')),
        ),
      ),
    );
  }
}
