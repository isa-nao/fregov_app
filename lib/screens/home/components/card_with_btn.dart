import 'package:flutter/material.dart';
import 'package:fregov_app/constants.dart';

class CardWithButton extends StatelessWidget {
  final String header;
  final String title;
  final String footer;
  final Function onPressed;
  final String buttontext;

  const CardWithButton({
    Key? key,
    required this.header,
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
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: header,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                      const TextSpan(
                        text: '\n'
                      ),
                      TextSpan(
                        text: title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: <Widget> [
                    Text(
                      footer,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    const Spacer(),
                    OutlinedButton(
                      onPressed: () {
                        onPressed();
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: kPrimaryColorGreen,
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        minimumSize: Size.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 2,
                      ),
                      child: Text(
                        buttontext,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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