import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/features/home/data/models/slider_response/slider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide Slider;
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeHorizScroll extends StatefulWidget {
  const HomeHorizScroll({super.key, required this.products});
  final List<Slider> products;

  @override
  State<HomeHorizScroll> createState() => _HomeHorizScrollState();
}

class _HomeHorizScrollState extends State<HomeHorizScroll> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            height: 170.0,
            viewportFraction: 1,
            autoPlay: false,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            },
          ),
          itemCount: widget.products.length,
          itemBuilder: (BuildContext context, activeIndex, int pageViewIndex) {
            return Container(
              margin: const EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  widget.products[activeIndex].image ?? '',
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 14),
        SmoothPageIndicator(
          controller: PageController(initialPage: activeIndex),
          count: widget.products.length,
          effect: ExpandingDotsEffect(
            dotColor: AppColors.lightGrayColor,
            activeDotColor: AppColors.primaryColor,
            dotHeight: 7,
            dotWidth: 7,
            expansionFactor: 5,
          ),
          onDotClicked: (index) {},
        ),
      ],
    );
  }
}
