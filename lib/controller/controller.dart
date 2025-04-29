import 'dart:convert';
import 'package:get/get.dart';
import 'package:newproject/model/product.dart';
import 'package:http/http.dart' as http;

class HomePageController extends GetxController {
  List itemlist = [
    {'image': 'assert/img/Union.png', 'name': 'Women'},
    {'image': 'assert/img/Vector (5).png', 'name': 'Men'},
    {'image': 'assert/img/Vector (6).png', 'name': 'Kids'},
    {'image': 'assert/img/Vector (7).png', 'name': 'Mom & Baby'},
  ];

  @override
  void onInit() {
    super.onInit();
    fetchdata();
  }

  Future<List<Data>> fetchdata() async {
    List<Data> productDataList = [];
    final response = await http.get(
      Uri.parse('https://nooksouq.mobituts.com/api/v2/get-mostpopular'),
    );
    try {
      var listOfData = jsonDecode(response.body);
      List items = listOfData['data'];
      productDataList = items.map<Data>((e) => Data.fromJson(e)).toList();

      return productDataList;
    } catch (e) {
      print('Failed to load users');
      throw Exception(e);
    }
  }
}
