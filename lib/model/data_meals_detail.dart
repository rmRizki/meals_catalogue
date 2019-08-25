class Detail {
  List<DetailProperty> detail = [];
  
  Detail.fromJson(Map<String, dynamic> json) {
    json['meals'].forEach((json) {
      detail.add(DetailProperty.fromJson(json));
    });
  }
}

class DetailProperty {
  final String idDetail;
  final String nameDetail;
  final String thumbDetail;
  final String descDetail;
  final String categoryDetail;

  DetailProperty(this.idDetail, this.nameDetail, this.thumbDetail,
      this.descDetail, this.categoryDetail);

  factory DetailProperty.fromJson(Map<String, dynamic> json) {
    return DetailProperty(json['idMeal'], json['strMeal'], json['strMealThumb'],
        json['strInstructions'], json['strCategory']);
  }
}
