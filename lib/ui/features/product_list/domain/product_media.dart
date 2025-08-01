class ProductMedia {
  final int id;
  final String name;
  final String path;

  ProductMedia({required this.id, required this.name, required this.path});

  factory ProductMedia.fromJson(Map<String, dynamic> json) =>
      ProductMedia(id: json['id'], name: json['name'], path: json['path']);
}
