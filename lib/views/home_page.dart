import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/product_controller.dart';
import '../controllers/cart_controller.dart';
import 'cart_page.dart'; // Pastikan jalur impor sesuai dengan struktur folder Anda.
import 'sell_page.dart'; // Tambahkan impor untuk SellPage

class HomePage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.storefront, color: Colors.white),
            SizedBox(width: 10),
            Text(
              'Fashionista Consignment',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Get.to(() => CartPage());
            },
          ),
        ],
        backgroundColor: Colors.blueAccent,
        elevation: 5, // Memberikan bayangan pada AppBar
      ),
      body: Obx(() {
        return GridView.builder(
          padding: const EdgeInsets.all(10.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Jumlah kolom dalam grid
            mainAxisSpacing: 10.0, // Jarak antar baris
            crossAxisSpacing: 10.0, // Jarak antar kolom
            childAspectRatio: 0.75, // Proporsi lebar dan tinggi item
          ),
          itemCount: productController.products.length,
          itemBuilder: (context, index) {
            final product = productController.products[index];
            return InkWell(
              onTap: () {
                Get.snackbar(
                  'Selected Item',
                  'You clicked on ${product.name}!',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.blueAccent,
                  colorText: Colors.white,
                  icon: Icon(Icons.shopping_bag, color: Colors.white),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 5, // Bayangan pada Card
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(15.0)),
                      child: Image.network(
                        product.imageUrl,
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 5),
                          Text(
                            '\$${product.price}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: () {
                                cartController.addToCart(product);
                                Get.snackbar(
                                  'Added to Cart',
                                  '${product.name} added successfully!',
                                  snackPosition: SnackPosition.BOTTOM,
                                  duration: Duration(seconds: 2),
                                  backgroundColor: Colors.blueAccent,
                                  colorText: Colors.white,
                                  icon: Icon(Icons.check_circle,
                                      color: Colors.white),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Icon(Icons.add_shopping_cart, size: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Arahkan ke halaman SellPage saat tombol ditekan
          Get.to(() => SellProductPage());
        },
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.sell), // Ganti ikon menjadi ikon jual
      ),
    );
  }
}
