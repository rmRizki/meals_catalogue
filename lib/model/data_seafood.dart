class Seafood {
  final String idSeafood;
  final String nameSeafood;
  final String thumbSeafood;

  Seafood(this.idSeafood, this.nameSeafood, this.thumbSeafood);

  factory Seafood.fromJson(Map<String, dynamic> json) {
    return Seafood(json['idMeal'], json['strMeal'], json['strMealThumb']);
  }
}
