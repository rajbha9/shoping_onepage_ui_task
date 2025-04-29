import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:newproject/controller/controller.dart';
import 'package:newproject/widget/allcategories.dart';
import 'package:newproject/widget/newitems.dart';
import 'package:newproject/widget/starwidget.dart';

class Myhomepage extends StatefulWidget {
  const Myhomepage({super.key});

  @override
  State<Myhomepage> createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomePageController());
    return Scaffold(
      bottomNavigationBar: GNav(
        gap: 10.0,
        color: Colors.grey,
        textStyle: TextStyle(fontSize: 17, color: Colors.deepPurple),
        iconSize: 30,

        activeColor: Colors.deepPurple,
        tabBackgroundColor: Colors.white.withOpacity(0.9),
        padding: EdgeInsets.all(8),
        tabMargin: EdgeInsets.all(8),
        // onTabChange: onTabTapped,
        // selectedIndex: _currentIndex,
        tabs: const [
          GButton(icon: Icons.home_rounded, text: 'home'),
          GButton(icon: Icons.add_circle_outline, text: 'Outfit'),
          GButton(icon: Icons.sell, text: 'Sell'),
          GButton(icon: Icons.favorite_border, text: 'Favourite'),
        ],
      ),
      backgroundColor: Colors.deepPurple,
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                          image: AssetImage(
                            'assert/img/heroicons-outline_menu-alt-3.png',
                          ),
                        ),
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Home',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                          image: AssetImage('assert/img/Vector (3).png'),
                        ),
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                          image: AssetImage('assert/img/Vector (4).png'),
                        ),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'All Categories',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:
                        controller.itemlist.map((e) {
                          return Allcategories(
                            img: e['image'],
                            name: e['name'],
                          );
                        }).toList(),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Hot Deals",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return Image.asset(
                          "assert/img/Frame 513749.png",
                          fit: BoxFit.fill,
                        );
                      },
                      itemCount: 3,
                      pagination: SwiperPagination(),
                      control: SwiperControl(),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "What's New",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "View All",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [Newitems(), Newitems(), Newitems()]),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 300,
                    child: FutureBuilder(
                      future: controller.fetchdata(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return GridView.builder(
                            itemCount: snapshot.data!.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  crossAxisSpacing: 0,
                                  mainAxisSpacing: 0,
                                  childAspectRatio: 0.6,
                                ),
                            itemBuilder: (context, index) {
                              final item = snapshot.data![index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 150,
                                  width: 75,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      spacing: 10,
                                      children: [
                                        (item.image == '')
                                            ? SizedBox(
                                              height: 75,
                                              width: 60,
                                              child: Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            )
                                            : SizedBox(
                                              height: 75,
                                              width: 60,
                                              child: Image.network(
                                                item.image.toString(),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                        Text(
                                          item.name.toString(),
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Community Stars",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "View All",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Starwidget(
                          assetName: 'assert/img/Frame 513760.png',
                          pepolename: 'Daana Alan',
                        ),
                        Starwidget(
                          assetName: 'assert/img/Frame 513760 (1).png',
                          pepolename: 'David Trim',
                        ),
                        Starwidget(
                          assetName: 'assert/img/Frame 513760 (2).png',
                          pepolename: 'Same kane',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
