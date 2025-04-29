import 'package:flutter/material.dart';

class Newitems extends StatelessWidget {
  const Newitems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: 175,
            width: 125,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(75),
              ),
            ),
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: 125,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('assert/img/Frame 513754.png'),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'AED 10.00',
                      style: TextStyle(fontSize: 10),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 20,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.deepPurple.withOpacity(0.5),
                          borderRadius: BorderRadiusDirectional.circular(30)),
                      child: Text('\u2766 10K', style: TextStyle(fontSize: 10)),
                    )
                  ],
                ),
                Text(
                  "xs/UK 6 /US 2",
                  style: TextStyle(fontSize: 10),
                ),
                Text(
                  "Armani Exchange",
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
              backgroundColor: Colors.deepPurple,
              child: Icon(
                Icons.keyboard_arrow_right_rounded,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
