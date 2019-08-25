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

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idMeal'] = this.idDetail;
    data['strMeal'] = this.nameDetail;
    data['strMealThumb'] = this.thumbDetail;
    data['strInstructions'] = this.descDetail;
    data['strCategory'] = this.categoryDetail;  
    return data;
  }
}
