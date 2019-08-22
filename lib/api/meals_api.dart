import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:meals_catalogue/model/data_dessert.dart';
import 'package:meals_catalogue/model/data_seafood.dart';
import 'package:meals_catalogue/model/detail_data.dart';

class MealsApi {
  final baseUrl = "https://www.themealdb.com/api/json/v1/1";

  Future<Dessert> loadDataDessert() async{
    String dataUrl = "$baseUrl/filter.php?c=Dessert";
    http.Response response = await http.get(dataUrl);
    var responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      return Dessert.fromJson(responseJson);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<Seafood> loadDataSeafood() async{
    String dataUrl = "$baseUrl/filter.php?c=Seafood";
    http.Response response = await http.get(dataUrl);
    var responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      return Seafood.fromJson(responseJson);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<Detail> loadDataDetail(String id) async{
    String dataUrl = "$baseUrl/lookup.php?i=$id";
    http.Response response = await http.get(dataUrl);
    var responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      return Detail.fromJson(responseJson);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
