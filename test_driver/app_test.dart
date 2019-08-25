import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'app_key_binder.dart';

void main() {
  group('Meals Catalogue Test', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Dessert Menu', () async {
      await driver.waitFor(futureGridDessert);
      await driver.scroll(gridDessert, 0, -2500, Duration(seconds: 5));
    });

    test('Seafood Menu', () async {
      await driver.tap(botNavSeafood);
      await driver.waitFor(futureGridSeafood);
      await driver.scroll(gridSeafood, 0, -2500, Duration(seconds: 5));
    });

    test("Search data dessert and add to favorite", () async {
      await driver.tap(searchFab);
      await driver.waitFor(searchResult);

      await driver.tap(searchDessertButton);
      await driver.tap(searchTextField);
      await driver.enterText("sugar pie");
      await driver.waitFor(searchResult);
      await driver.tap(searchResultItem);

      await driver.tap(favoriteFab);
      await driver.tap(find.pageBack());
    });

    test("Search data seafood", () async {
      await driver.tap(searchSeafoodButton);
      await driver.tap(searchTextField);
      await driver.enterText("kedgeree");
      await driver.waitFor(searchResult);
      await driver.tap(searchResultItem);

      await driver.tap(favoriteFab);
      await driver.tap(find.pageBack());
      await driver.tap(find.pageBack());
    });

    test('Favorite Menu', () async {
      await driver.tap(botNavFavorite);
      await driver.tap(favoriteSeafood);
      await driver.tap(favoriteDessert);
    });

    test('Select favorite dessert and remove from favorite', () async {
      await driver.tap(favoriteDessertItem);
      await driver.tap(favoriteFab);
      await driver.tap(find.pageBack());
    });

    test('Select favorite seafood and remove from favorite', () async {
      await driver.tap(favoriteSeafood);
      await driver.tap(favoriteSeafoodItem);
      await driver.tap(favoriteFab);
      await driver.tap(find.pageBack());
    });

    test("Back to first page", () async {
      await driver.tap(botNavDessert);
    });
  });
}
