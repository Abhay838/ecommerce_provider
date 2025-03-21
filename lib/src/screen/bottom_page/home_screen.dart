import 'package:ecommerce_provider/src/component/ui_screen_helper/ui_helper/custom_product_card.dart';
import 'package:ecommerce_provider/src/list/all_list.dart';
import 'package:ecommerce_provider/src/list/beauty_list.dart';
import 'package:ecommerce_provider/src/list/jewelry_list.dart';
import 'package:ecommerce_provider/src/list/men_list.dart';
import 'package:ecommerce_provider/src/list/shoe_list.dart';
import 'package:ecommerce_provider/src/list/women_list.dart';
import 'package:ecommerce_provider/src/model/product_model.dart';
import 'package:flutter/material.dart';

import '../../component/ui_screen_helper/custom_widget/my_search_bar.dart';
import '../../component/ui_screen_helper/ui_helper/custom_app_bar.dart';
import '../../component/ui_screen_helper/ui_helper/custom_image_slider.dart';
import '../../component/ui_screen_helper/ui_helper/row_text.dart';
import '../../list/category_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSlider = 0;

  //category
  int selectedCategory = 0;
  List<List<ProductModel>> category = [
    allList,
    shoesList,
    beautyList,
    womenList,
    jewelryList,
    menFashion,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // for custom appbar
              const CustomAppBar(),
              const SizedBox(height: 20),
              //search bar
              const MySearchBar(),
              const SizedBox(height: 20),
              //image slider
              CustomImageSlider(
                currentSlider: currentSlider,
                onChanged: (value) {
                  setState(() {
                    currentSlider = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              //category selection
              SizedBox(
                // color: Colors.red,
                height: 120,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final image = categoryList[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategory = index;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: selectedCategory == index
                                ? Colors.blue[200]
                                : Colors.transparent,
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 65,
                                width: 65,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(image.image),
                                      fit: BoxFit.fill,
                                    )),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                image.title,
                                style: const TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    //separatorBuilder: (context, index) => const SizedBox(width: 20),
                    itemCount: categoryList.length),
              ),
              const SizedBox(height: 10),
              //Text
              const RowText(),
              //for shopping items
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.78,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                ),
                itemCount: category[selectedCategory].length,
                itemBuilder: (context, index) {
                  return CustomProductCard(
                      product: category[selectedCategory][index]);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
