class Meal {
  List<MealsProperty> meals = [];

  Meal.fromJson(Map<String, dynamic> json) {
    json['meals'].forEach((json) {
      meals.add(MealsProperty.fromJson(json));
    });
  }
}

class MealsProperty {
  final String idMeal;
  final String nameMeal;
  final String thumbMeal;
  final String categoryMeal;
  final String descMeal;

  MealsProperty(this.idMeal, this.nameMeal, this.thumbMeal, this.categoryMeal,
      this.descMeal);

  factory MealsProperty.fromJson(Map<String, dynamic> json) {
    return MealsProperty(json['idMeal'], json['strMeal'], json['strMealThumb'],
        json['strCategory'], json['strInstructions']);
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idMeal'] = this.idMeal;
    data['strMeal'] = this.nameMeal;
    data['strMealThumb'] = this.thumbMeal;
    data['strCategory'] = this.categoryMeal;
    return data;
  }
}
