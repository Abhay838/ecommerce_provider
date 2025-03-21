import 'package:ecommerce_provider/src/list/category_list.dart';
import 'package:flutter/material.dart';

class CategorySelection extends StatefulWidget {
  const CategorySelection({super.key});

  @override
  State<CategorySelection> createState() => _CategorySelectionState();
}

class _CategorySelectionState extends State<CategorySelection> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.red,
      height: 120,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final image = categoryList[index];
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: selectedIndex == index
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
    );
  }
}
