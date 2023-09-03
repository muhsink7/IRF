import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../ui/screens/home_screen/home_controller.dart';

class ImageBanner extends StatelessWidget {
  ImageBanner({Key? key, required this.imageLists});
  final _homecontroller = Get.put(HomeController());


  final CarouselController carouselController = CarouselController();
  final List imageLists;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: GetBuilder<HomeController>(
        builder: (controller) {
          return Stack(
            children: [
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      carouselController.nextPage();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: CarouselSlider(
                        carouselController: carouselController,
                        options: CarouselOptions(
                          height: 80,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          pauseAutoPlayOnTouch: true,
                          aspectRatio: 2.0,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            // Update the currentBannerIndex using the HomeController
                            controller.currentBannerIndex(index);
                          },
                        ),
                        items: controller.imageList.isNotEmpty
                            ? controller.imageList
                            .map(
                              (item) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: AssetImage(item['image']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                            .toList()
                            : [],
                      ),
                    ),
                  ),
                ],
              ),
              // Other code...
            ],
          );
        },
      ),
    );
  }
}
