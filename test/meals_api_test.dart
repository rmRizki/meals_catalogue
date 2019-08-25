import 'package:meals_catalogue/api/meals_api.dart';
import 'package:meals_catalogue/model/data_dessert.dart';
import 'package:meals_catalogue/model/data_meals_detail.dart';
import 'package:meals_catalogue/model/data_seafood.dart';
import 'package:meals_catalogue/model/data_search.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:test/test.dart';

class MockApi extends Mock implements http.Client {}

main() {
  final client = MockApi();
  MealsApi mealsApi = MealsApi();
  final baseUrl = "https://www.themealdb.com/api/json/v1/1";

  String idMock = "52893";
  String nameMock = "Apple & Blackberry Crumble";
  String thumbMock =
      "https:\/\/www.themealdb.com\/images\/media\/meals\/xvsurr1511719182.jpg";

  group("Request Dessert Data", () {
    test("Request Succeded", () async {
      when(client.get("$baseUrl/filter.php?c=Dessert")).thenAnswer((_) async =>
          http.Response(
              DessertProperty(idMock, nameMock, thumbMock).toString(), 200));

      expect(await mealsApi.loadDataDessert(), isA<Dessert>());
    });
    test("Request Failed", () async {
      when(client.get("$baseUrl/filter.php?c=Dessert"))
          .thenAnswer((_) async => http.Response('Failed to load data', 404));

      expect(await mealsApi.loadDataDessert(), isA<Dessert>());
    });
  });

  group("Request Seafood Data", () {
    test("Request Succeded", () async {
      when(client.get("$baseUrl/filter.php?c=Seafood")).thenAnswer((_) async =>
          http.Response(
              SeafoodProperty(idMock, nameMock, thumbMock).toString(), 200));

      expect(await mealsApi.loadDataSeafood(), isA<Seafood>());
    });
    test("Request Failed", () async {
      when(client.get("$baseUrl/filter.php?c=Seafood"))
          .thenAnswer((_) async => http.Response('Failed to load data', 404));

      expect(await mealsApi.loadDataSeafood(), isA<Seafood>());
    });
  });

  group("Request Detail Data", () {
    test("Request Succeded", () async {
      when(client.get("$baseUrl/lookup.php?i=$idMock")).thenAnswer((_) async =>
          http.Response(
              MealsProperty(idMock, nameMock, thumbMock, "MockCategory",
                      "MockDescription")
                  .toString(),
              200));

      expect(await mealsApi.loadDataDetail(idMock), isA<Meal>());
    });
    test("Request Failed", () async {
      when(client.get("$baseUrl/lookup.php?i=$idMock"))
          .thenAnswer((_) async => http.Response('Failed to load data', 404));

      expect(await mealsApi.loadDataDetail(idMock), isA<Meal>());
    });
  });

  group("Request Search Data", () {
    test("Request Succeded", () async {
      when(client.get("$baseUrl/search.php?s=$nameMock")).thenAnswer(
          (_) async => http.Response(
              SearchProperty(idMock, nameMock, thumbMock).toString(), 200));

      expect(await mealsApi.loadDataSearch(nameMock,"Dessert"), isA<Search>());
    });
    test("Request Failed", () async {
      when(client.get("$baseUrl/search.php?s=$nameMock"))
          .thenAnswer((_) async => http.Response('Failed to load data', 404));

      expect(await mealsApi.loadDataSearch(nameMock,"Dessert"), isA<Search>());
    });
  });
}
