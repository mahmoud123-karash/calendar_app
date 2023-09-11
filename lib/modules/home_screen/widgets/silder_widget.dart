import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key, required this.images, required this.autoPlay});
  final List<String> images;
  final bool autoPlay;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: CarouselSlider(
        items: images.map(
          (i) {
            return Builder(
              builder: (BuildContext context) => GestureDetector(
                onTap: () {},
                child: Image.network(
                  i,
                  fit: BoxFit.cover,
                  height: 200,
                ),
              ),
            );
          },
        ).toList(),
        options: CarouselOptions(
          initialPage: 2,
          viewportFraction: 1,
          autoPlay: autoPlay,
          height: 200,
        ),
      ),
    );
  }
}
