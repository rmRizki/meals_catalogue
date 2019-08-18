class Detail {
  final String idDetail;
  final String nameDetail;
  final String thumbDetail;
  final String descDetail;

  Detail(this.idDetail, this.nameDetail, this.thumbDetail, this.descDetail);

  factory Detail.fromJson(Map<String, dynamic> json) {
    return Detail(json['idMeal'], json['strMeal'], json['strMealThumb'],json['strInstructions']);
  }
}
