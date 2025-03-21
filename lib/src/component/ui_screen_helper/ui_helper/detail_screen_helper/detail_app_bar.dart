import 'package:ecommerce_provider/src/model/product_model.dart';
import 'package:flutter/material.dart';

import '../../../../provider/favorite_provider.dart';

class DetailAppBar extends StatelessWidget {
  final ProductModel product;
  const DetailAppBar({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          IconButton(
              style: IconButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.all(10),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              iconSize: 20,
              icon: const Icon(Icons.arrow_back_ios)),
          const Spacer(),
          IconButton(
              style: IconButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.all(10),
              ),
              onPressed: () {},
              iconSize: 20,
              icon: const Icon(Icons.share_outlined)),
          const SizedBox(width: 10),
          IconButton(
              style: IconButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.all(10),
              ),
              onPressed: () {
                provider.toggleFavorite(product: product);
              },
              iconSize: 20,
              icon: Icon(
                provider.isExist(product)
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: Colors.black,
                size: 25,
              )),
        ],
      ),
    );
  }
}
