import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageItemWidget extends StatelessWidget {
  const ImageItemWidget({super.key, required this.image, required this.isdark});
  final String image;
  final bool isdark;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Center(
          child: CachedNetworkImage(
            width: double.infinity,
            fit: BoxFit.cover,
            imageUrl: image,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Container(
              color: isdark ? Colors.white : Colors.black,
            ),
            errorWidget: (context, url, error) =>
                const Icon(Icons.image_search_rounded),
          ),
        ),
      ),
    );
  }
}
