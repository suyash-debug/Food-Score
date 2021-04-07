class FoodProduct {
  String nova1;
  String nutri1;
  String name;
  String nutri;
  String nova;
  String ingredients;
  String additive;
  String additives;
  String addedMinerals;
  String img;

  FoodProduct(
      {this.nova1,
      this.nutri1,
      this.name,
      this.nutri,
      this.nova,
      this.ingredients,
      this.additive,
      this.additives,
      this.addedMinerals,
      this.img});

  FoodProduct.fromJson(Map<String, dynamic> json) {
    nova1 = json['nova1'];
    nutri1 = json['nutri1'];
    name = json['name'];
    nutri = json['nutri'];
    nova = json['nova'];
    ingredients = json['ingredients'];
    additive = json['additive'];
    additives = json['additives'];
    addedMinerals = json['added_minerals'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nova1'] = this.nova1;
    data['nutri1'] = this.nutri1;
    data['name'] = this.name;
    data['nutri'] = this.nutri;
    data['nova'] = this.nova;
    data['ingredients'] = this.ingredients;
    data['additive'] = this.additive;
    data['additives'] = this.additives;
    data['added_minerals'] = this.addedMinerals;
    data['img'] = this.img;
    return data;
  }
}
