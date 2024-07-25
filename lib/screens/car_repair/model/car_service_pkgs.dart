class CarServicePkgsModel {
  final String title;
  final String duration;
  final String serviceCount;
  final String applicable;
  final String warrantyValid;
  final String image;
  final bool active;
  final String price;

  CarServicePkgsModel({
    required this.title,
    required this.duration,
    required this.serviceCount,
    required this.applicable,
    required this.warrantyValid,
    required this.active,
    required this.image,
    required this.price,
  });

  static CarServicePkgsModel empty() => CarServicePkgsModel(
        title: '',
        duration: '',
        serviceCount: '',
        applicable: '',
        warrantyValid: '',
        active: false,
        image: '',
        price: '',
      );

  factory CarServicePkgsModel.fromSnapshot(Map<String, dynamic> document) {
    return CarServicePkgsModel(
      title: document['Title'],
      duration: document['Duration'],
      serviceCount: document['ServiceCount'],
      applicable: document['Applicable'],
      warrantyValid: document['WarrantyValid'],
      active: document['Active'],
      image: document['Image'],
      price: document['Price'],
    );
  }

  Map<String, dynamic> toJson() => {
        'Title': title,
        'Duration': duration,
        'ServiceCount': serviceCount,
        'Applicable': applicable,
        'WarrantyValid': warrantyValid,
        'Active': active,
        'Image': image,
        'Price': price,
      };
}
