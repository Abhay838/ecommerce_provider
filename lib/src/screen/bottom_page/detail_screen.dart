import 'package:ecommerce_provider/src/component/colors.dart';
import 'package:ecommerce_provider/src/component/ui_screen_helper/ui_helper/detail_screen_helper/add_to_cart.dart';
import 'package:ecommerce_provider/src/component/ui_screen_helper/ui_helper/detail_screen_helper/detail_product_image_slider.dart';
import 'package:ecommerce_provider/src/component/ui_screen_helper/ui_helper/detail_screen_helper/product_description.dart';
import 'package:ecommerce_provider/src/component/ui_screen_helper/ui_helper/detail_screen_helper/product_detail.dart';
import 'package:ecommerce_provider/src/model/product_model.dart';
import 'package:flutter/material.dart';

import '../../component/ui_screen_helper/ui_helper/detail_screen_helper/detail_app_bar.dart';

class DetailScreen extends StatefulWidget {
  final ProductModel productModel;
  const DetailScreen({super.key, required this.productModel});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late ProductModel product;
  int currentImageIndex = 0;
  int currentColor = 0;

  @override
  void initState() {
    product = widget.productModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: contentColor,
      //for add to cart, icon and quantity
      floatingActionButton: AddToCart(product: product),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //for back button
              DetailAppBar(product: product),
              //detail product image slider
              DetailProductImageSlider(
                  onChange: (p0) {
                    setState(() {
                      currentImageIndex = p0;
                    });
                  },
                  image: product.image),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) => AnimatedContainer(
                    duration: const Duration(microseconds: 300),
                    width: currentImageIndex == index ? 15 : 8,
                    height: 8,
                    margin: const EdgeInsets.only(right: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: currentImageIndex == index
                            ? Colors.black
                            : Colors.transparent,
                        border: Border.all(
                          color: Colors.black,
                        )),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: media.width * 1,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40),
                    )),
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                  bottom: media.height * 0.2,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // for product name, price, rating and seller
                    ProductDetail(product: product),
                    const SizedBox(height: 10),
                    const Text(
                      "Color",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: List.generate(
                        product.colors.length,
                        (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              currentColor = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: currentColor == index
                                  ? Colors.white
                                  : product.colors[index],
                              border: currentColor == index
                                  ? Border.all(color: product.colors[index])
                                  : null,
                            ),
                            padding: currentColor == index
                                ? const EdgeInsets.all(3)
                                : null,
                            margin: const EdgeInsets.only(right: 15),
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: product.colors[index],
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // for description
                    ProductDescription(description: product.description),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
