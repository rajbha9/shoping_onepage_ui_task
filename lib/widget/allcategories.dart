import 'package:flutter/material.dart';

class Allcategories extends StatelessWidget {
  String? img;
  String? name;

  Allcategories({super.key, required this.img, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.deepPurple,
            image: DecorationImage(
              image: AssetImage(img!),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          name!,
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
