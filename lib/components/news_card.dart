import 'package:flutter/material.dart';
import 'uility_ui.dart' as utilUI;

class NewsCard extends StatelessWidget {
  const NewsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        utilUI.ReusableCard(
          padding: 0,
          margin: {"left": 10, "right": 32, "bottom": 10, "top": 0},
          circularRadius: 15,
          cardBGColor: Colors.grey,
          child: SizedBox(
            height: 150,
            width: 150,
            child: Image(
              image: NetworkImage(
                  "https://cdn-icons-png.flaticon.com/512/55/55283.png"),
            ),
          ),
        ),
        utilUI.ReusableCard(
          padding: 0,
          margin: {"left": 10, "right": 30, "bottom": 10, "top": 0},
          circularRadius: 15,
          cardBGColor: Colors.grey,
          child: SizedBox(
            height: 140,
            width: 140,
            child: Image(
              image: NetworkImage(
                  "https://cdn-icons-png.flaticon.com/512/55/55283.png"),
            ),
          ),
        )
      ],
    );
  }
}
