import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:navigation/model/product/product.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<Product> product = [];
  bool isLoading = false;

  final Dio dio = Dio();

  @override
  void initState() {
    getProduct();
    super.initState();
  }

  Future getProduct() async {
    try {
      isLoading = true;

      // await Future.delayed(Duration(seconds: 20));
      final response = await dio.get("https://fakestoreapi.com/products");
      print('API RESPONSE ${response.statusCode}');
      final List data = response.data;
      //json we need to convert it into dart object /
      product = data.map((e) => Product.fromJson(e)).toList();

      // setState(() {});
    } catch (error) {
      print("Error $error");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('')),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: product.length,
              itemBuilder: (context, index) {
                final item = product[index];

                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.08),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        item.image ?? '',
                        width: 90,
                        height: 90,
                        fit: BoxFit.contain,
                      ),

                      const SizedBox(width: 14),

                      // Center Content
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title ?? 'n/a',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 6),

                            Text(
                              item.category ?? 'n/a',
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 14,
                              ),
                            ),

                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 18,
                                ),

                                const SizedBox(width: 4),

                                Text(
                                  item.rating!.rate.toString(),
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),

                                const SizedBox(width: 6),

                                Text(
                                  item.rating!.count.toString(),
                                  style: TextStyle(color: Colors.grey.shade600),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Right Side
                      Column(
                        children: [
                          Text(
                            '\$ ${item.price}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),

                          const SizedBox(height: 14),

                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (_) => CartDetailsScreen(product: product),
                              //   ),
                              // );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
