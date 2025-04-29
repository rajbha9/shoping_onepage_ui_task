import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class Starwidget extends StatelessWidget {
  String? assetName;
  String? pepolename;
  Starwidget({super.key, required this.assetName, required this.pepolename});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      height: 250,
      width: 120,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),
      child: Column(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(assetName!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(pepolename!),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                RatingStars(
                  value:4,
                  starBuilder:
                      (index, color) => Icon(Icons.star, color: color),
                  starCount: 5,
                  valueLabelColor: const Color(0xff9b9b9b),
                  valueLabelTextStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 12.0,
                  ),
                  valueLabelRadius: 10,
                  maxValue: 5,
                  starSpacing: 2,
                  maxValueVisibility: true,
                  valueLabelVisibility: true,
                  animationDuration: Duration(milliseconds: 1000),
                  valueLabelPadding: const EdgeInsets.symmetric(
                    vertical: 1,
                    horizontal: 8,
                  ),
                  valueLabelMargin: const EdgeInsets.only(right: 8),
                  starOffColor: const Color(0xffe7e8ea),
                  starColor: Colors.yellow,
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 30,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.deepPurple,
            ),
            alignment: Alignment.center,
            child: Text('Follow', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
