class BrandModel {
  BrandModel({required this.name, required this.image});
  String name;
  String image;

  static BrandModel empty() => BrandModel(name: '', image: '');

  factory BrandModel.fromJson(data) => BrandModel(name: data['Name'], image: data['Image']);

  Map<String, dynamic> toJson() => {'Name': name, 'Image': image};
}
