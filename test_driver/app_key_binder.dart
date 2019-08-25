import 'package:flutter_driver/flutter_driver.dart';
import 'package:meals_catalogue/helper/key_name.dart';

final futureGridDessert = find.byValueKey(FUTURE_GRID_DESSERT);
final gridDessert = find.byValueKey(GRID_DESSERT);
final futureGridSeafood = find.byValueKey(FUTURE_GRID_SEAFOOD);
final gridSeafood = find.byValueKey(GRID_SEAFOOD);

final favoriteFab = find.byValueKey(FAVORITE_FAB);
final favoriteDessert = find.byValueKey(FAVORITE_DESSERT);
final favoriteDessertItem = find.byValueKey(FAVORITE_DESSERT_ITEM);
final favoriteSeafood = find.byValueKey(FAVORITE_SEAFOOD);
final favoriteSeafoodItem = find.byValueKey(FAVORITE_SEAFOOD_ITEM);

final searchFab = find.byValueKey(SEARCH_FAB);
final searchTextField = find.byValueKey(SEARCH_TEXTFIELD);
final searchDessertButton = find.byValueKey(SEARCH_DESSERT_BUTTON);
final searchSeafoodButton = find.byValueKey(SEARCH_SEAFOOD_BUTTON);
final searchResult = find.byValueKey(SEARCH_RESULT);
final searchResultItem = find.byValueKey(SEARCH_RESULT_ITEM);

final botNavDessert = find.byValueKey(BOT_NAV_DESSERT);
final botNavSeafood = find.byValueKey(BOT_NAV_SEAFOOD);
final botNavFavorite = find.byValueKey(BOT_NAV_FAVORITE);
