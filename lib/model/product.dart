class Data {
  final int? id;
  final String? name;
  final String? slug;
  final String? image;
  // final int? categoryId;

  Data({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    // required this.categoryId,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
       id: json['id'] ?? 0,                  // If null, fallback to 0
      name: json['name'] ?? 'Unnamed',      // If null, fallback to 'Unnamed'
      slug: json['slug'] ?? '',             // If null, fallback to ''
      image: json['image'] ?? '', 
      // categoryId: json['categoryId'] ?? null,
    );
  }
}
