class Dessert {
  List<DessertProperty> dessert = [];

  Dessert.fromJson(Map<String, dynamic> json) {
    json['meals'].forEach((json){
      dessert.add(DessertProperty.fromJson(json));
    });
  }
}

class DessertProperty{
  final String idDessert;
  final String nameDessert;
  final String thumbDessert;

  DessertProperty(this.idDessert, this.nameDessert, this.thumbDessert);

  factory DessertProperty.fromJson(Map<String, dynamic> json) {
    return DessertProperty(json['idMeal'], json['strMeal'], json['strMealThumb']);
  }
}
