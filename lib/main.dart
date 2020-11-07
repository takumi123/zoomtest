import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zoom Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Container(
          child: Center(
            child: UiKitView(
              viewType: 'my_first_view',
              creationParams: <String, dynamic>{
                'label': "test",
              },
              creationParamsCodec: StandardMessageCodec(),
            ),
          ),
        ),
      ),
    );
  }
}
