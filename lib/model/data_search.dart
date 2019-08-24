class Search {
  List<SearchProperty> search = [];

  Search.fromJson(Map<String, dynamic> json, String category) {
    search.clear();
    json['meals'].forEach((json) {
      if (json['strCategory'] == category) {
        search.add(SearchProperty.fromJson(json));
      }
    });
  }
}

class SearchProperty {
  final String idSearch;
  final String nameSearch;
  final String thumbSearch;

  SearchProperty(
      this.idSearch, this.nameSearch, this.thumbSearch);

  factory SearchProperty.fromJson(Map<String, dynamic> json) {
    return SearchProperty(json['idMeal'], json['strMeal'], json['strMealThumb']);
  }
}
