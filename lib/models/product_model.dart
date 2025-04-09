class Product {
  final String id;
  final String title;
  final String description;
  final String brandImagePath;
  final List<String> sizes;
  final String imagePath;
  final double price;
  final double discount;
  final double rating;
  bool isSaved;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.brandImagePath,
      required this.sizes,
      required this.imagePath,
      required this.price,
      required this.discount,
      required this.rating,
      this.isSaved = false});
}
