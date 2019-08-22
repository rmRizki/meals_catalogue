class Seafood {
List<SeafoodProperty> seafood = [];

  Seafood.fromJson(Map<String, dynamic> json) {
    json['meals'].forEach((json){
      seafood.add(SeafoodProperty.fromJson(json));
    });
  }
}

class SeafoodProperty{
  final String idSeafood;
  final String nameSeafood;
  final String thumbSeafood;

  SeafoodProperty(this.idSeafood, this.nameSeafood, this.thumbSeafood);

  factory SeafoodProperty.fromJson(Map<String, dynamic> json) {
    return SeafoodProperty(json['idMeal'], json['strMeal'], json['strMealThumb']);
  }
}
