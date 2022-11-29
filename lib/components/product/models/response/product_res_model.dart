class ProductResModel {
  ProductResModel({
    required this.id,
    required this.name,
    required this.price,
    required this.color,
    required this.count,
    required this.image,
    required this.brand,
  });
  late final int id;
  late final String name;
  late final int price;
  late final String color;
  late final int count;
  late final String image;
  late final String brand;

  ProductResModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    price = json['price'];
    color = json['color'];
    count = json['count'];
    image = json['image'];
    brand = json['brand'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['price'] = price;
    _data['color'] = color;
    _data['count'] = count;
    _data['image'] = image;
    _data['brand'] = brand;
    return _data;
  }
}