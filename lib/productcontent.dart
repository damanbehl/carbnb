import 'package:flutter/material.dart';


class productcontent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),

          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [ Text("starting",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                ),
              ),

              Text('65CAD',style: TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.w900,
          ),),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('name',style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w900,
              ),),

              Text('id number',style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w900,
              ),),

            ],
          ),
          SizedBox(
            height: 25,
          ),
          Column(
            children: [
              Text('gchcglkxbdhywvjxsjgvuffcv hgcfzhv jhgrhvhjjl nfrdxetzrydhvkj'),
            ],
          ),



        ],
      ),
    );
  }
}

