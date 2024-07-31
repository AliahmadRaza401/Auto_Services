class CarModel {
  CarModel({required this.name, required this.image, required this.brand});
  String name;
  String brand;
  String image;

  static CarModel empty() => CarModel(name: '', image: '', brand: '');

  factory CarModel.fromJson(data) => CarModel(name: data['Name'], image: data['Image'], brand: data['Brand']);

  Map<String, dynamic> toJson() => {'Name': name, 'Image': image, 'Brand': brand};
}
