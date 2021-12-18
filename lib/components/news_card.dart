import 'package:flutter/material.dart';
import 'uility_ui.dart' as utilUI;

class NewsCard extends StatelessWidget {
  const NewsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        utilUI.ReusableCard(
          padding: 0,
          margin: const {"left": 20, "right": 0, "bottom": 10, "top": 0},
          circularRadius: 15,
          cardBGColor: Colors.grey,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.20,
            width: MediaQuery.of(context).size.width * 0.30,
            child: const Image(
              image: NetworkImage(
                  "https://cdn-icons-png.flaticon.com/512/55/55283.png"),
            ),
          ),
        ),
        utilUI.ReusableCard(
          padding: 0,
          margin: {"left": MediaQuery.of(context).size.width*0.22, "right": 0, "bottom": 10, "top": 0},
          circularRadius: 15,
          cardBGColor: Colors.grey,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.20,
            width: MediaQuery.of(context).size.width * 0.30,
            child: const Image(
              image: NetworkImage(
                  "https://cdn-icons-png.flaticon.com/512/55/55283.png"),
            ),
          ),
        )
      ],
    );
  }
}
