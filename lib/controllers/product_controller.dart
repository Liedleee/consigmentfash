import 'package:get/get.dart';
import '../models/product.dart';

class ProductController extends GetxController {
  var products = <Product>[
    Product(
      id: 'p1', // Tambahkan id unik
      name: 'Flannel',
      imageUrl:
          'https://images.unsplash.com/photo-1613447895642-b36fc3186cb2?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8a2VtZWphfGVufDB8fDB8fHww',
      price: 200.0,
    ),
    Product(
      id: 'p2', // Tambahkan id unik
      name: 'Jeans',
      imageUrl:
          'https://plus.unsplash.com/premium_photo-1674828601362-afb73c907ebe?q=80&w=453&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      price: 150.0,
    ),
    Product(
      id: 'p3', // Tambahkan id unik
      name: 'Sneakers',
      imageUrl:
          'https://images.unsplash.com/photo-1599670998937-441a3a74b2f1?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8U25lYWtlcnN8ZW58MHx8MHx8fDA%3D',
      price: 300.0,
    ),
    // Tambahkan produk lainnya sesuai kebutuhan
  ].obs;
}
