import 'package:cached_network_image/cached_network_image.dart';
import 'package:calendar_app/cubit/calendar_cubit/calendar_cubit.dart';
import 'package:calendar_app/models/banner_model.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class SwiperBannerWidget extends StatelessWidget {
  const SwiperBannerWidget(
      {super.key, required this.banners, required this.isdark});
  final List<BannerModel> banners;
  final bool isdark;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 200,
        child: Swiper(
          physics: banners.length == 1
              ? const NeverScrollableScrollPhysics()
              : const BouncingScrollPhysics(),
          onTap: (index) async {
            CalendarCubit.get(context).openBrowser(uri: banners[index].uri!);
          },
          autoplay: banners.length == 1 ? false : true,
          index: 0,
          itemCount: banners.length,
          itemBuilder: (context, index) => ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
              maxHeightDiskCache: 10,
              fit: BoxFit.cover,
              imageUrl: banners[index].image!,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Container(
                color: isdark ? Colors.white : Colors.black,
              ),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.image_search_rounded),
            ),
          ),
        ),
      ),
    );
  }
}
