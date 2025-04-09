import 'package:marketplace/models/product_model.dart';
import 'package:stacked/stacked.dart';

class ProductService with ListenableServiceMixin {
  final List<Product> _products = [
    Product(
        id: '1',
        title: 'Sony Cd Player',
        description:
            "The name says it all, the right size slightly snugs the body leaving enough room for comfort in the sleeves and waist.",
        brandImagePath: 'assets/images/brand_logos/brand_3.png',
        sizes: ['S', 'M', 'L'],
        imagePath: 'assets/images/cassette.png',
        price: 60,
        discount: 10,
        rating: 4.9,
        isSaved: false,
        reviews: [
          {
            'id': '1',
            'name': 'John Doe',
            'rating': 4.5,
            'comment':
                'This item is very good, my son likes it very much and plays every day',
          },
          {
            'id': '2',
            'name': 'Wade Warren',
            'rating': 4.5,
            'comment':
                'This item is very good, my son likes it very much and plays every day',
          },
          {
            'id': '3',
            'name': 'John Doe',
            'rating': 4.5,
            'comment':
                'This item is very good, my son likes it very much and plays every day',
          },
          {
            'id': '4',
            'name': 'Wade Warren',
            'rating': 4.5,
            'comment':
                'This item is very good, my son likes it very much and plays every day',
          },
          {
            'id': '5',
            'name': 'John Doe',
            'rating': 4.5,
            'comment':
                'This item is very good, my son likes it very much and plays every day',
          },
        ]),
    Product(
        id: '2',
        title: 'Sony Cd Player',
        description:
            "The name says it all, the right size slightly snugs the body leaving enough room for comfort in the sleeves and waist.",
        brandImagePath: 'assets/images/brand_logos/brand_3.png',
        sizes: ['S', 'M', 'L'],
        imagePath: 'assets/images/cassette.png',
        price: 60,
        discount: 10,
        rating: 4.9,
        isSaved: false,
        reviews: [
          {
            'id': '1',
            'name': 'John Doe',
            'rating': 4.5,
            'comment':
                'This item is very good, my son likes it very much and plays every day',
          },
          {
            'id': '2',
            'name': 'Wade Warren',
            'rating': 4.5,
            'comment':
                'This item is very good, my son likes it very much and plays every day',
          },
          {
            'id': '3',
            'name': 'John Doe',
            'rating': 4.5,
            'comment':
                'This item is very good, my son likes it very much and plays every day',
          },
          {
            'id': '4',
            'name': 'Wade Warren',
            'rating': 4.5,
            'comment':
                'This item is very good, my son likes it very much and plays every day',
          },
          {
            'id': '5',
            'name': 'John Doe',
            'rating': 4.5,
            'comment':
                'This item is very good, my son likes it very much and plays every day',
          },
        ]),
    Product(
        id: '3',
        title: 'Sony Cd Player',
        description:
            "The name says it all, the right size slightly snugs the body leaving enough room for comfort in the sleeves and waist.",
        brandImagePath: 'assets/images/brand_logos/brand_3.png',
        sizes: ['S', 'M', 'L'],
        imagePath: 'assets/images/cassette.png',
        price: 60,
        discount: 10,
        rating: 4.9,
        isSaved: false,
        reviews: [
          {
            'id': '1',
            'name': 'John Doe',
            'rating': 4.5,
            'comment':
                'This item is very good, my son likes it very much and plays every day',
          },
          {
            'id': '2',
            'name': 'Wade Warren',
            'rating': 4.5,
            'comment':
                'This item is very good, my son likes it very much and plays every day',
          },
          {
            'id': '3',
            'name': 'John Doe',
            'rating': 4.5,
            'comment':
                'This item is very good, my son likes it very much and plays every day',
          },
          {
            'id': '4',
            'name': 'Wade Warren',
            'rating': 4.5,
            'comment':
                'This item is very good, my son likes it very much and plays every day',
          },
          {
            'id': '5',
            'name': 'John Doe',
            'rating': 4.5,
            'comment':
                'This item is very good, my son likes it very much and plays every day',
          },
        ]),
    Product(
        id: '4',
        title: 'Sony Cd Player',
        description:
            "The name says it all, the right size slightly snugs the body leaving enough room for comfort in the sleeves and waist.",
        brandImagePath: 'assets/images/brand_logos/brand_3.png',
        sizes: ['S', 'M', 'L'],
        imagePath: 'assets/images/cassette.png',
        price: 60,
        discount: 10,
        rating: 4.9,
        isSaved: false,
        reviews: [
          {
            'id': '1',
            'name': 'John Doe',
            'rating': 4.5,
            'comment':
                'This item is very good, my son likes it very much and plays every day',
          },
          {
            'id': '2',
            'name': 'Wade Warren',
            'rating': 4.5,
            'comment':
                'This item is very good, my son likes it very much and plays every day',
          },
          {
            'id': '3',
            'name': 'John Doe',
            'rating': 4.5,
            'comment':
                'This item is very good, my son likes it very much and plays every day',
          },
          {
            'id': '4',
            'name': 'Wade Warren',
            'rating': 4.5,
            'comment':
                'This item is very good, my son likes it very much and plays every day',
          },
          {
            'id': '5',
            'name': 'John Doe',
            'rating': 4.5,
            'comment':
                'This item is very good, my son likes it very much and plays every day',
          },
        ]),
    Product(
        id: '5',
        title: 'Sony Cd Player',
        description:
            "The name says it all, the right size slightly snugs the body leaving enough room for comfort in the sleeves and waist.",
        brandImagePath: 'assets/images/brand_logos/brand_3.png',
        sizes: ['S', 'M', 'L'],
        imagePath: 'assets/images/cassette.png',
        price: 60,
        discount: 10,
        rating: 4.9,
        isSaved: false,
        reviews: [
          {
            'id': '1',
            'name': 'John Doe',
            'rating': 4.5,
            'comment':
                'This item is very good, my son likes it very much and plays every day',
          },
          {
            'id': '2',
            'name': 'Wade Warren',
            'rating': 4.5,
            'comment':
                'This item is very good, my son likes it very much and plays every day',
          },
          {
            'id': '3',
            'name': 'John Doe',
            'rating': 4.5,
            'comment':
                'This item is very good, my son likes it very much and plays every day',
          },
          {
            'id': '4',
            'name': 'Wade Warren',
            'rating': 4.5,
            'comment':
                'This item is very good, my son likes it very much and plays every day',
          },
          {
            'id': '5',
            'name': 'John Doe',
            'rating': 4.5,
            'comment':
                'This item is very good, my son likes it very much and plays every day',
          },
        ]),
    Product(
        id: '6',
        title: 'Sony Cd Player',
        description:
            "The name says it all, the right size slightly snugs the body leaving enough room for comfort in the sleeves and waist.",
        brandImagePath: 'assets/images/brand_logos/brand_3.png',
        sizes: ['S', 'M', 'L'],
        imagePath: 'assets/images/cassette.png',
        price: 60,
        discount: 10,
        rating: 4.9,
        isSaved: false,
        reviews: [
          {
            'id': '1',
            'name': 'John Doe',
            'rating': 4.5,
            'comment':
                'This item is very good, my son likes it very much and plays every day',
          },
          {
            'id': '2',
            'name': 'Wade Warren',
            'rating': 4.5,
            'comment':
                'This item is very good, my son likes it very much and plays every day',
          },
          {
            'id': '3',
            'name': 'John Doe',
            'rating': 4.5,
            'comment':
                'This item is very good, my son likes it very much and plays every day',
          },
          {
            'id': '4',
            'name': 'Wade Warren',
            'rating': 4.5,
            'comment':
                'This item is very good, my son likes it very much and plays every day',
          },
          {
            'id': '5',
            'name': 'John Doe',
            'rating': 4.5,
            'comment':
                'This item is very good, my son likes it very much and plays every day',
          },
        ]),
    Product(
        id: '6',
        title: 'Sony Cd Player',
        description:
            "The name says it all, the right size slightly snugs the body leaving enough room for comfort in the sleeves and waist.",
        brandImagePath: 'assets/images/brand_logos/brand_3.png',
        sizes: ['S', 'M', 'L'],
        imagePath: 'assets/images/cassette.png',
        price: 160,
        discount: 10,
        rating: 4.9,
        isSaved: false,
        reviews: [
          {
            'id': '1',
            'name': 'John Doe',
            'rating': 4.5,
            'comment':
                'This item is very good, my son likes it very much and plays every day',
          },
          {
            'id': '2',
            'name': 'Wade Warren',
            'rating': 4.5,
            'comment':
                'This item is very good, my son likes it very much and plays every day',
          },
          {
            'id': '3',
            'name': 'John Doe',
            'rating': 4.5,
            'comment':
                'This item is very good, my son likes it very much and plays every day',
          },
          {
            'id': '4',
            'name': 'Wade Warren',
            'rating': 4.5,
            'comment':
                'This item is very good, my son likes it very much and plays every day',
          },
          {
            'id': '5',
            'name': 'John Doe',
            'rating': 4.5,
            'comment':
                'This item is very good, my son likes it very much and plays every day',
          },
        ]),
    Product(
        id: '7',
        title: 'Sony Cd Player',
        description:
            "The name says it all, the right size slightly snugs the body leaving enough room for comfort in the sleeves and waist.",
        brandImagePath: 'assets/images/brand_logos/brand_3.png',
        sizes: ['S', 'M', 'L'],
        imagePath: 'assets/images/cassette.png',
        price: 78.99,
        discount: 10,
        rating: 4.9,
        isSaved: false,
        reviews: [
          {
            'id': '1',
            'name': 'John Doe',
            'rating': 4.5,
            'comment':
                'This item is very good, my son likes it very much and plays every day',
          },
          {
            'id': '2',
            'name': 'Wade Warren',
            'rating': 4.5,
            'comment':
                'This item is very good, my son likes it very much and plays every day',
          },
          {
            'id': '3',
            'name': 'John Doe',
            'rating': 4.5,
            'comment':
                'This item is very good, my son likes it very much and plays every day',
          },
          {
            'id': '4',
            'name': 'Wade Warren',
            'rating': 4.5,
            'comment':
                'This item is very good, my son likes it very much and plays every day',
          },
          {
            'id': '5',
            'name': 'John Doe',
            'rating': 4.5,
            'comment':
                'This item is very good, my son likes it very much and plays every day',
          },
        ]),
  ];

  List<Product> get products => _products;

  //Takes a product model as parameter and adds a new product to the existing catalog
  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }

  //Takes the id and an updated product model as a parameter and updates the product on that id with the updated info provided
  void updatedProduct(String id, Product updatedProduct) {
    final index = _products.indexWhere((p) => p.id == id);
    if (index > 0) {
      _products[index] = updatedProduct;
      notifyListeners();
    }
  }

  void removeProduct(String id) {
    _products.removeWhere((p) => p.id == id);
    notifyListeners();
  }

  List<Product> searchProducts(String query) {
    return _products
        .where((product) =>
            product.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  void toggleSavedStatus(String id) {
    final index = _products.indexWhere((p) => p.id == id);
    if (index != -1) {
      _products[index] = Product(
        id: _products[index].id,
        title: _products[index].title,
        description: _products[index].description,
        brandImagePath: _products[index].brandImagePath,
        sizes: _products[index].sizes,
        imagePath: _products[index].imagePath,
        price: _products[index].price,
        discount: _products[index].discount,
        rating: _products[index].rating,
        isSaved: !_products[index].isSaved,
        reviews: _products[index].reviews,
        // Toggle the saved status
      );
      notifyListeners(); // Notify listeners about the change
    }
  }
}
