import 'package:ecommerce_provider/src/component/colors.dart';
import 'package:ecommerce_provider/src/model/product_model.dart';
import 'package:ecommerce_provider/src/provider/favorite_provider.dart';
import 'package:ecommerce_provider/src/screen/bottom_page/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomProductCard extends StatelessWidget {
  final ProductModel product;
  const CustomProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(
                productModel: product,
              ),
            ));
      },
      child: Stack(
        children: [
          Card(
            elevation: 1,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: contentColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  Center(
                    child: Hero(
                      tag: product.image,
                      child: Image.asset(
                        product.image,
                        width: media.width * 0.3,
                        height: media.height * 0.18,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      product.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "\$ ${product.price}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(
                          product.colors.length,
                          (index) => Container(
                            width: 14,
                            height: 14,
                            margin: const EdgeInsets.only(right: 4),
                            decoration: BoxDecoration(
                              color: product.colors[index],
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          // for favorite border
          Positioned(
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                  height: 35,
                  width: 35,
                  decoration: const BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(10),
                      )),
                  child: Consumer<FavoriteProvider>(
                    builder: (context, provider, child) {
                      return GestureDetector(
                        onTap: () {
                          provider.toggleFavorite(product: product);
                        },
                        child: Icon(
                          provider.isExist(product)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.white,
                          size: 20,
                        ),
                      );
                    },
                  )),
            ),
          )
        ],
      ),
    );
  }
}
