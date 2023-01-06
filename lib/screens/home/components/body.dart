import 'package:flutter/material.dart';
import 'package:fregov_app/screens/home/components/card_with_btn.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
          children: <Widget> [
            CardWithButton(
              header: 'header',
              title: 'title',
              footer: 'footer',
              buttontext: 'buttontext',
              onPressed: () {
                print('test'); //ボタンを押した時のアクション
              },
            ),
            CardWithButton(
              header: 'header',
              title: 'title',
              footer: 'footer',
              buttontext: 'buttontext',
              onPressed: () {
                print('test'); //ボタンを押した時のアクション
              },
            ),
            CardWithButton(
              header: 'header',
              title: 'title',
              footer: 'footer',
              buttontext: 'buttontext',
              onPressed: () {
                print('test'); //ボタンを押した時のアクション
              },
            ),
          ],
    );
  }
}