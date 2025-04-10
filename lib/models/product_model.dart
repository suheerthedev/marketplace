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
  final String companyName;
  bool isSaved;
  bool isInCart;
  final List reviews;

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
      required this.companyName,
      this.isSaved = false,
      this.isInCart = false,
      required this.reviews});
}
