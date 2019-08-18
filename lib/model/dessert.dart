class Dessert {
  final String idDessert;
  final String nameDessert;
  final String thumbDessert;

  Dessert(this.idDessert, this.nameDessert, this.thumbDessert);

  factory Dessert.fromJson(Map<String, dynamic> json) {
    return Dessert(json['idMeal'], json['strMeal'], json['strMealThumb']);
  }
}
