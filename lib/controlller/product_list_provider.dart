import 'package:coba/models/Product.dart';
import 'package:flutter/material.dart';

class ProductListProvider extends ChangeNotifier {
  final List<Product> _products = [
    Product(
        'https://img.freepik.com/free-photo/graphic-woman-dress-trendy-design-white-background_460848-13623.jpg?w=360&t=st=1692532822~exp=1692533422~hmac=7a3d35dc72e345fe76c429dfb2d2c19ae9d3a19d41a481ace06861d5ca1e7797',
        'Produk 1',
        100,
        false),
    Product(
        'https://img.freepik.com/free-photo/fashion-woman-with-clothes_1203-8301.jpg?w=360&t=st=1692966177~exp=1692966777~hmac=c6ed8572122c506517570843f51205b86860aa10ed1e56180ee354aa1f9a7d0e',
        'Produk 2',
        150,
        false),
    Product(
        'https://img.freepik.com/free-psd/mens-tri-blend-crew-tee-mockup_126278-130.jpg?w=740&t=st=1692966221~exp=1692966821~hmac=41a4e7f7209ac8c4f00b2da91bd44e10332e34f045e7928767413e13b5804768',
        'Produk 3',
        200,
        false),
    Product(
        'https://img.freepik.com/premium-psd/isometric-cloth-3d-isolated-render_28315-9297.jpg?w=740',
        'Produk 4',
        200,
        false),
  ];

  List<Product> get products => _products;

  void toggleLike(Product product) {
    int index = _products.indexWhere((items) => items.title == product.title);
    _products[index].isLiked = !_products[index].isLiked;
    notifyListeners();
  }

  List<Product> getLikedProducts() {
    return _products.where((product) => product.isLiked).toList();
  }
}
