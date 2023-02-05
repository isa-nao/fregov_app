import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fregov_app/constants.dart';
import 'package:fregov_app/screens/home/components/default_listview.dart';
import 'package:fregov_app/screens/home/components/search_box.dart';
import 'package:fregov_app/screens/home/components/search_listview.dart';


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

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

final searchBoxProvider = StateProvider((ref) => false);

class MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  void initState() {
    super.initState();
    ref.read(searchBoxProvider);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ref.watch(searchBoxProvider)
        ? SearchListView()
        : DefaultListView()
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: ref.watch(searchBoxProvider) 
      ? SearchBox() 
      : Image.asset(
          'asset/images/dog-illust.jpg',
          height: 40,
          width: 40,
        ),
      actions: ref.watch(searchBoxProvider) 
        ? [IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              ref.read(searchBoxProvider.notifier).update((state) => false);
            }
          )] 
        : [IconButton(
            icon: const Icon(Icons.search, size: 35),
            onPressed: () {
              ref.read(searchBoxProvider.notifier).update((state) => true);
            }
          )]
    );
  }
}