import 'package:bytebankapp/view/dashboard.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
  // save(Contact(1, 'alex', 1000)).then((id) {
  //   findAll().then((contacts) => debugPrint(contacts.toString()));
  // });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.green[900],
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: Colors.blueAccent[700]),
          buttonTheme: ButtonThemeData(
              buttonColor: Colors.blueAccent[700],
              textTheme: ButtonTextTheme.primary)),
      home: const Dashboard(),
    );
  }
}
