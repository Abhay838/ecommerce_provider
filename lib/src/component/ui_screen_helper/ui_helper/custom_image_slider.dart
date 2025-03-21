import 'package:flutter/material.dart';

class CustomImageSlider extends StatelessWidget {
  final Function(int) onChanged;
  final int currentSlider;
  const CustomImageSlider(
      {super.key, required this.onChanged, required this.currentSlider});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 220,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: PageView(
              scrollDirection: Axis.horizontal,
              allowImplicitScrolling: true,
              onPageChanged: onChanged,
              physics: const ClampingScrollPhysics(),
              children: [
                Image.asset('assets/slider.jpg', fit: BoxFit.fill),
                Image.asset('assets/slider3.png', fit: BoxFit.fill),
                Image.asset('assets/image1.png', fit: BoxFit.cover),
              ],
            ),
          ),
        ),
        Positioned.fill(
          bottom: 10,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => AnimatedContainer(
                  duration: const Duration(microseconds: 300),
                  width: currentSlider == index ? 15 : 8,
                  height: 8,
                  margin: const EdgeInsets.only(right: 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: currentSlider == index
                          ? Colors.black
                          : Colors.transparent,
                      border: Border.all(
                        color: Colors.black,
                      )),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
