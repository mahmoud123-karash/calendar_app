import 'package:calendar_app/cubit/calendar_cubit.dart';
import 'package:calendar_app/models/banner_model.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class SwiperBannerWidget extends StatelessWidget {
  const SwiperBannerWidget({super.key, required this.banners});
  final List<BannerModel> banners;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 180,
        child: Swiper(
          onTap: (index) async {
            CalendarCubit.get(context).openBrowser(uri: banners[index].uri!);
          },
          autoplay: true,
          index: 0,
          itemCount: banners.length,
          itemBuilder: (context, index) => ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              banners[index].image!,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
