import 'package:flutter/material.dart';

class DetailProductImageSlider extends StatelessWidget {
  final Function(int) onChange;
  final String image;
  const DetailProductImageSlider({
    super.key,
    required this.onChange,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return SizedBox(
      height: media.height * 0.2,
      child: PageView.builder(
        onPageChanged: onChange,
        itemBuilder: (context, index) {
          return Hero(tag: image, child: Image.asset(image));
        },
      ),
    );
  }
}
