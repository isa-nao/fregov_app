import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FREGOV',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color.fromRGBO(0, 114, 206, 1),
          elevation: 0
        ),
      ),
      home: const MyHomePage(title: 'FREGOV'),
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
      appBar: AppBar(
        title: const Text('FREGOV'),
      ),
      body:Column(
            children: <Widget> [
              CardWithButton(
                name: const Text(
                  '福岡県福岡市',
                  style: TextStyle(fontSize: 15),
                  ),
                title: const Text(
                  'タイトルタイトルタイトルタイトルタイトルタイトル',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                footer: const Text(
                  '更新日:2022/12/20',
                  style: TextStyle(fontSize: 15),
                  ),
                buttontext: const Text(
                  '詳細をみる',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                onPressed: () {
                  print('テスト');
                },
              ),
              CardWithButton(
                name: const Text(
                  '福岡県福岡市',
                  style: TextStyle(fontSize: 15),
                  ),
                title: const Text(
                  'タイトルタイトルタイトルタイトルタイトルタイトル',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                footer: const Text(
                  '更新日:2022/12/20',
                  style: TextStyle(fontSize: 15),
                  ),
                buttontext: const Text(
                  '詳細をみる',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                onPressed: () {
                  print('テスト');
                },
              ),
            ],
      ),
    );
  }
}


// CardWithButtonのUIを生成
class CardWithButton extends StatelessWidget {
  final Text name;
  final Text title;
  final Text footer;
  final Function onPressed;
  final Text buttontext;


  const CardWithButton({
    Key? key,
    required this.name, 
    required this.title, 
    required this.footer, 
    required this.onPressed,
    required this.buttontext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 5,
          margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                name,
                title,
                Row(
                  children: <Widget> [
                    footer,
                    const Expanded(child: SizedBox()),
                    OutlinedButton(
                      onPressed: () {
                        onPressed();
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color.fromRGBO(132, 189, 0, 1),
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        minimumSize: Size.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 2,
                      ),
                      child: buttontext,
                    ),
                  ]
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}