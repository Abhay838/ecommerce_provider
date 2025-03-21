import 'package:ecommerce_provider/src/component/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          style: IconButton.styleFrom(
            backgroundColor: contentColor,
            padding: const EdgeInsets.all(10),
          ),
          onPressed: () {},
          icon: Image.asset(
            'assets/icon.png',
            height: 20,
          ),
        ),
        IconButton(
            style: IconButton.styleFrom(
              backgroundColor: contentColor,
              padding: const EdgeInsets.all(10),
            ),
            onPressed: () {},
            iconSize: 20,
            icon: const Icon(Icons.notifications_outlined)),
      ],
    );
  }
}
