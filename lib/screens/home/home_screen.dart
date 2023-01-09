import 'package:flutter/material.dart';
import 'package:fregov_app/constants.dart';
import 'package:fregov_app/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'FREGOV';
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: kPrimaryColorBlue,
          elevation: 0
        ),
      ),
      home: const MyHomePage(title: appTitle),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body:const Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(title),
    );
  }
}